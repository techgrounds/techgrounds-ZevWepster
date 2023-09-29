@description('The name of the Virtual Machine Scale Set.')
param vmssName string = 'WebVMSS'

@description('Number of VM instances the set starts with (10 or less).')
@minValue(1)
@maxValue(10)
param instanceCount int = 3 // 3 for downscale, 1 for stress test and upscale showcase


@secure()
param adminUsername string

@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string

@description('Unique DNS Name for the Public IP used to access the Virtual Machine Scale Set.')
param dnsLabelPrefix string = toLower('${vmssName}-${uniqueString(resourceGroup().id)}')

@description('Name of the deployment environment.')
param environmentName string

@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version.')
@allowed([
  'Ubuntu-1804'
  'Ubuntu-2004'
  'Ubuntu-2204'
])
param ubuntuOSVersion string = 'Ubuntu-2204'



@description('Location for all resources.')
param location string = resourceGroup().location

@description('Select IP address sku based on environment.')
param publicIpSku string = environmentName == 'Production' ? 'Standard' : 'Basic'

param vmScaleSetName string = 'webScaleSet'
param appGatewayName string = '${vmScaleSetName}appGw'
param vnet1Name string
param subnet_agwName string


@description('VM Size.')
param vmSku string = 'Standard_B1s'

param subnet1Name string

@description('Availability zone allocation.')
var availabilityZones = environmentName == 'Development' ? null : [
  '2'
]

var imageReference = {
  'Ubuntu-1804': {
    publisher: 'Canonical'
    offer: 'UbuntuServer'
    sku: '18_04-lts-gen2'
    version: 'latest'
  }
  'Ubuntu-2004': {
    publisher: 'Canonical'
    offer: '0001-com-ubuntu-server-focal'
    sku: '20_04-lts-gen2'
    version: 'latest'
  }
  'Ubuntu-2204': {
    publisher: 'Canonical'
    offer: '0001-com-ubuntu-server-jammy'
    sku: '22_04-lts-gen2'
    version: 'latest'
  }
}

var osDiskType = 'StandardSSD_LRS'
var publicIPAddressName = '${vmssName}PublicIP'
var linuxConfiguration = {
  disablePasswordAuthentication: true
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: loadTextContent('certs/sshkey.pub')
      }
    ]
  }
}

resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: publicIPAddressName
  location: location
  zones: availabilityZones
  sku: {
    name: publicIpSku
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: dnsLabelPrefix
    }
  }
}

resource virtualMachineScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2023-07-01' = {
  name: vmssName
  location: location
  zones: availabilityZones  
  sku: {
    name: vmSku 
    tier: 'Standard'
    capacity: instanceCount
  }
  properties: {
    overprovision: true
    upgradePolicy: {
      mode: 'Automatic'
    }
    automaticRepairsPolicy: {
      enabled: true
      gracePeriod: 'PT30M'
    }
    singlePlacementGroup: true
    platformFaultDomainCount: 1
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          createOption: 'FromImage'
          managedDisk: {
            storageAccountType: osDiskType
          }
        }
        imageReference: imageReference[ubuntuOSVersion]
      }
      osProfile: {
        computerNamePrefix: vmssName
        adminUsername: adminUsername
        adminPassword: adminPassword
        customData: loadFileAsBase64('deloyApache.sh')
        linuxConfiguration: linuxConfiguration
      }
      securityProfile: {
        encryptionAtHost: true
      }
        networkProfile: {
        networkInterfaceConfigurations: [
         {
           name: '${vmssName}NetIntConfig'
           properties: {
             primary: true
              ipConfigurations: [
               {
                name: '${vmssName}IpConfig'
                properties: {
                 subnet: {
                   id: resourceId('Microsoft.Network/virtualNetworks/subnets/', vnet1Name, subnet1Name)
                 }
                 applicationGatewayBackendAddressPools: [
                   {
                     id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools/', appGatewayName, 'backendPool')
                    }
                  ]
                }
              }
            ]
          }
        }
      ]
    }
    extensionProfile: {
      extensions: [
        {
          name: 'Health'
          properties: {
            autoUpgradeMinorVersion: true
            publisher: 'Microsoft.ManagedServices'
            type: 'ApplicationHealthLinux'
            typeHandlerVersion: '1.0'
            settings: {
              protocol: 'http'
              port: 80
            } 
          }
        }
      ]
    }
  }
}
  dependsOn: [
    appGateway
  ]
}

resource autoscaleHost 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscaleHost'
  location: location
  properties: {
    name: 'autoscaleHost'
    targetResourceUri: virtualMachineScaleSet.id
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          default: '1'
          maximum: '3'
          minimum: '1'
        }
        rules: [
          {
          metricTrigger: {
            metricName:'Percentage CPU'
            metricResourceUri: virtualMachineScaleSet.id
            timeGrain: 'PT1M'
            statistic: 'Average'
            timeWindow: 'PT5M'
            timeAggregation: 'Average'
            operator: 'GreaterThan'
            threshold: 50
          }
          scaleAction: {
            direction: 'Increase'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
        {
          metricTrigger: {
            metricName: 'Percentage CPU'
            metricResourceUri: virtualMachineScaleSet.id
            operator: 'LessThan'
            statistic: 'Average'
            threshold: 30
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT3M'
          }
          scaleAction: {
            value: '1'
            cooldown: 'PT3M'
            direction: 'Decrease'
            type: 'ChangeCount'
          }
        }
       ]
      }
    ]
  }
}

@description('Azure Load Balancer for HTTPS')
resource appGateway 'Microsoft.Network/applicationGateways@2023-05-01' = {
  name: appGatewayName
  location: location
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 10
    }
    gatewayIPConfigurations: [
      {
        name: 'agwIPconfig'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet1Name, subnet_agwName)
          }
        }
      }
    ]
    
    sslCertificates: [
      {
        name: 'agwSslCert'
        properties: {
          data: loadFileAsBase64('certs/certificate.pfx')
          password: '1234Bananas!'
          
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'agwFrontendIP'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'agwFrontendPort'
        properties: {
          port: 443
        }
      }
      {
        name: 'redirPort'
        properties: {
          port: 80
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'backendPool'
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'agwBackendHttpSettings'
        properties: {
          port: 80
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
          requestTimeout: 30
          pickHostNameFromBackendAddress: false
        }
      }
    ]
    httpListeners: [
      {
        name: 'appGatewayHttpListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', '${vmScaleSetName}appGw', 'agwFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', '${vmScaleSetName}appGw', 'agwFrontendPort')
          }
          protocol: 'Https'
          sslCertificate: {
            id: resourceId('Microsoft.Network/applicationGateways/sslCertificates', '${vmScaleSetName}appGw','agwSslCert')
          }
        }
      }
      {
        name: 'redirHttpToHttpsListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', '${vmScaleSetName}appGw', 'agwFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', '${vmScaleSetName}appGw', 'redirPort')
          }
          protocol: 'Http'
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'rule1'
        properties: {
          ruleType: 'Basic'
          priority: 100
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', '${vmScaleSetName}appGw', 'appGatewayHttpListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', '${vmScaleSetName}appGw', 'backendPool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', '${vmScaleSetName}appGw', 'agwBackendHttpSettings')
          }
        }
      }
      {
        name: 'rule2'
        properties: {
          ruleType: 'Basic'
          priority: 110
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', '${vmScaleSetName}appGw','redirHttpToHttpsListener')
          }
          redirectConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/redirectConfigurations', '${vmScaleSetName}appGw', 'redirConfigHttpToHttps')
          }
        }
      }
     ]
     redirectConfigurations: [
      {
        name: 'redirConfigHttpToHttps'
        properties:{
          redirectType: 'Permanent'
          includePath: true
          includeQueryString: true
          targetListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', '${vmScaleSetName}appGw', 'appGatewayHttpListener')
          }
        }
      }
    ]
  }
}

output vmssId string = virtualMachineScaleSet.id
output vmssName string = virtualMachineScaleSet.name
output appGatewayId string = appGateway.id
output appGatewayname string = appGateway.name
