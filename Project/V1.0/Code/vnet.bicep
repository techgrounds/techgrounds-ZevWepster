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
          addressPrefix: vnetIps[0]
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

output subnet1 string = virtualNetworkweb.properties.subnets[0].id
output subnet2 string = virtualNetworkadmin.properties.subnets[0].id
output nsg1 string = nsgWebServer.name
