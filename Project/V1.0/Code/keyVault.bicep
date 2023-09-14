@description('Specifies the name of the key vault.')
param keyVaultName string


@description('Specifies the Azure location where the key vault should be created.')
param location string = resourceGroup().location

@description('Username for the Virtual Machine.')
param adminUsername string = 'zevmin'

@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string

@description('Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault.')
param enabledForDeployment bool = true

@description('Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys.')
param enabledForDiskEncryption bool = true

@description('Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault.')
param enabledForTemplateDeployment bool = true

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Get it by using Get-AzSubscription cmdlet.')
param tenantId string = subscription().tenantId

// unwrapKey, wrapKey, get
@description('Specifies the permissions to keys in the vault. Valid values are: all, encrypt, decrypt, wrapKey, unwrapKey, sign, verify, get, list, create, update, import, delete, backup, restore, recover, and purge.')
param keysPermissions array = [
  'list'
  'unwrapKey'
  'wrapKey'
  'get'
]

@description('Specifies the permissions to secrets in the vault. Valid values are: all, get, list, set, delete, backup, restore, recover, and purge.')
param secretsPermissions array = [
  'all'
]

@description('Specifies whether the key vault is a standard vault or a premium vault.')
@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'

@description('Specifies name Managed ID')
param managedIDname string

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: managedIDname
  location: location
  tags: {
    tagName1: 'keyVaultID'
  }
  
  
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location:  location
  properties: {
    enabledForDeployment: enabledForDeployment
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enablePurgeProtection: true // set to false for "hard"delete ability, wont deploy though so change te name in main file
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
    tenantId: tenantId
    accessPolicies: [
      {
        objectId: managedIdentity.properties.principalId
        tenantId: tenantId
        permissions: {
          keys: keysPermissions
          secrets: secretsPermissions
        }
      }
    ]
    sku: {
      family: 'A'
      name: skuName
    }
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
      
    }
  }
}

resource secrets 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  name: adminUsername
  parent: keyVault
  properties: {
    value: adminPassword
    }
   
}

output keyVaultName string = keyVaultName
output keyVaultId string = keyVault.id


