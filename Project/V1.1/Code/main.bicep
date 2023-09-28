// az deployment sub create --location 'northeurope' --template-file ./main.bicep
// az deployment sub what-if --location 'northeurope' --template-file main.bicep
// az group delete --name rg-project-v10
// az deployment group what-if --template-file [template/location]
// New-AzResourceGroupDeployment -Whatif -templatefile [template/location]
// subscriptionID: 0da605a2-710e-4e87-bf32-a7eb762a555c
// objectID: 24fe9637-a8ed-4b4e-9eae-189cf3aad746
// admin username: zevmin
// adminww: fj243DikF5GG!
// ssh command: ssh -i ~/.ssh/sshkey zevmin@10.10.10.68
// sshww: testing

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

param resourceGroupName string = 'project-v11'

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


@description('The name of the managed identity.')
param managedIDname string = 'managedID'


@description('Adding ResourceGroup')
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}
@description('Module for Key Vault')
module keyVault 'keyVault.bicep' = {
  scope: rg
  name: 'keyVault'
  params: {
    location: location
    managedIDname: managedIDname
    adminUsername: adminUsername
    adminPassword: adminPassword
      
  }
}
@description('module for storage account deployment')
module storageAccount 'storage.bicep' = {
  name: 'storageaccount'
  scope: rg
  params: {
    location: location
    
  }
}

@description('Module for Vnet deployment')
module vnet 'network.bicep' = {
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
    subnetId: vnet.outputs.adminSub_id
    adminPassword: adminPassword
    adminUsername: adminUsername
    location: location
    environmentName: environmentName
  }
}

@description('Module for WebServer')
module webVMscaleSet 'WebVMscaleSet.bicep' = {
  scope: rg
  name: 'webVM'
  params: {
    location: location
    adminUsername: adminUsername
    adminPassword: adminPassword
    environmentName: environmentName
    subnet_agwName: vnet.outputs.subnet_agwName
    vnet1Name: 'vnet-webserver'
    subnet1Name: vnet.outputs.subnet1Name
  }
}




