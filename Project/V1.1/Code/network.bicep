param vnetIps array

@description('Specifies the location for resources.')
param location string

param trustedIpAddresses string

@description('Name for vnet1')
param vnet1Name string = 'vnet-webserver'

@description('Name for vnet2')
param vnet2Name string = 'vnet-management'

resource nsgWebServer 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: 'nsgWebServer'
  location: location
  properties: {
    securityRules: [
      {
        name: 'adminAccesSSH'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: vnetIps[1]
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'httpAccessWebserver'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80' 
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 101
          direction: 'Inbound'
        }
      }
      {
        name: 'httpsAccessWeb'
        properties: {
          access: 'Allow'
          direction: 'Inbound'
          priority: 102
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'allowAppGatewayPorts'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '65200-65535'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 103
          direction: 'Inbound'
        }
      } 
    ]
  }
}


resource nsgAdminServer 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: 'nsgAdminServer'
  location: location
  properties: {
    securityRules: [
       {
        name: 'allowRDP'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: trustedIpAddresses
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 102
          direction: 'Inbound'
        }
      }
    ]
  }
}

@description('adding Vnet for webserver')
resource virtualNetworkweb 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnet1Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetIps[0]
      ]
    }
    subnets: [
      {
        name: 'sub-webserver'
        properties: {
          addressPrefix: '10.10.10.64/26'
          
          }
        }
        {
          name: 'sub-agw'
          properties: {
            addressPrefix: '10.10.10.128/26'
            networkSecurityGroup: {
              id: nsgWebServer.id
            }
          }
        }
      ]
  }
}

@description('VnetPeering1 (webserver to admin)')
resource VnetPeering1'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01' = {
  name: '${vnet1Name}-${vnet2Name}'
  parent: virtualNetworkweb
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetworkadmin.id
    }
  }
}
@description('adding Vnet for admin server')
resource virtualNetworkadmin 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnet2Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetIps[1]
      ]
    }
    subnets: [
      {
        name: 'sub-management'
        properties: {
          addressPrefix: vnetIps[1]
          networkSecurityGroup: {
            id: nsgAdminServer.id
          }
        }
      }
    ]
  }
} 

@description('vnetPeering2 (admin to webserver)')
resource VnetPeering2'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01' = {
  name: '${vnet2Name}-${vnet1Name}'
  parent: virtualNetworkadmin
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetworkweb.id
    }
  }
}


  
output adminSub_id string = virtualNetworkadmin.properties.subnets[0].id
output adminSubName string = virtualNetworkadmin.properties.subnets[0].name
output nsg1 string = nsgWebServer.name
output webSub_id string = virtualNetworkweb.properties.subnets[0].id
output subnet1Name string = virtualNetworkweb.properties.subnets[0].name
output subnet_agwName string = virtualNetworkweb.properties.subnets[1].name
output subnet_agwID string = virtualNetworkweb.properties.subnets[1].id


