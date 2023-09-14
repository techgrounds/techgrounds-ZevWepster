// az deployment sub create --location 'northeurope' --template-file ./main.bicep
// az deployment sub what-if --location 'northeurope' --template-file main.bicep
// az group delete --name rg-project-v10
// az deployment group what-if --template-file [template/location]
// New-AzResourceGroupDeployment -Whatif -templatefile [template/location]
// subscriptionID: 0da605a2-710e-4e87-bf32-a7eb762a555c
// objectID: 24fe9637-a8ed-4b4e-9eae-189cf3aad746

targetScope = 'subscription'
@description('Location wherer resources will be deployed')
param location string = 'northeurope'

@description('Username for the Virtual Machine.')
param adminUsername string 

@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string 

param trustedIpAddresses string = '86.89.96.1'

param resourceGroupName string = 'rg-project-v10'


@description('A configuration for this deployment.')
@allowed([
  'Development'
  'Production'
])
param environmentName string = 'Production'

param vnetIps array = [
  '10.10.10.0/24'
  '10.20.20.0/24'
]

@description('Specifies the name of the key vault.')
param keyVaultName string = 'kv5-${uniqueString(resourceGroupName)}'

@description('The name of the managed identity.')
param managedIdentityName string = 'managedID'


@description('Adding ResourceGroup')
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}
@description('Module for Key Vault')
module keyVault 'keyVault.bicep' = {
  scope: rg
  name: keyVaultName
  params: {
    location: location
    managedIDname: managedIdentityName
    adminUsername: adminUsername
    adminPassword: adminPassword
    keyVaultName: keyVaultName
  }
}
@description('module for storage account deployment')
module storageAccount 'storage.bicep' = {
  name: 'storageAccount'
  scope: rg
  params: {
    location: location
    keyVaultName: keyVault.outputs.keyVaultName
    managedIDname: managedIdentityName
  }
}

@description('Module for Blob Container')
module blobCont 'blobcontainer.bicep' = {
  scope: rg
  name: 'blobcontainer'
  dependsOn: [
    storageAccount
  ]
  params: {
    storageAccountName: storageAccount.outputs.storageAccountName
  }
}

@description('Module for Vnet deployment')
module vnet 'vnet.bicep' = {
  name: 'vnetDeploy'
  scope: rg
  params: {
    location: location
    vnetIps: vnetIps
    trustedIpAddresses : trustedIpAddresses
  }
}

@description('Module for admin VM')
module adminVM 'adminVM.bicep' = {
  scope: rg
  name: 'admin-vm'
  params: {
    subnetId: vnet.outputs.subnet2
    adminPassword: adminPassword
    adminUsername: adminUsername
    location: location
    environmentName: environmentName
  }
}

@description('Module for WebServer')
module webVM 'webserverVM.bicep' = {
  scope: rg
  name: 'webVM'
  params: {
    location: location
    adminPasswordOrKey: adminPassword
    adminUsername: adminUsername
    environmentName: environmentName
    subnetId: vnet.outputs.subnet1
  }
}

@description('Module for Backup solution')
module backup 'backup-rsv.bicep' = {
  scope: rg
  name: 'backup'
  params: {
    location: location
    vmId: webVM.outputs.vmId
    vmName: webVM.outputs.vmName
    
  }
}


