@description('The location into which the resources should be deployed.')
param location string = resourceGroup().location

@description('The name of the existing User Assigned Identity.')
param managedIDname string

@description('The name of the Key Vault.')
param keyVaultName string

@description('Name of the key in the Key Vault')
param keyVaultKeyName string = 'cmkey'

@description('Expiration time of the key')
param keyExpiration int = 1694866626

@description('The name of the Storage Account')
@maxLength(23)
param storageAccountName string = 'scripts${uniqueString(resourceGroup().id)}'


resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' existing = {
  name: managedIDname  
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' existing  = {
  name: keyVaultName
}

resource kvKey 'Microsoft.KeyVault/vaults/keys@2021-10-01' = {
  parent: keyVault
  name: keyVaultKeyName
  properties: {
    attributes: {
      enabled: true
      exp: keyExpiration
    }
    keySize: 4096
    kty: 'RSA'
  }
}

resource storage 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${managedIdentity.id}': {}
    }
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
    encryption: {
      identity: {
        userAssignedIdentity: managedIdentity.id
      }
      services: {
         blob: {
           enabled: true
         }
      }
      keySource: 'Microsoft.Keyvault'
      keyvaultproperties: {
        keyname: kvKey.name
        keyvaulturi: endsWith(keyVault.properties.vaultUri,'/') ? substring(keyVault.properties.vaultUri,0,length(keyVault.properties.vaultUri)-1) : keyVault.properties.vaultUri
        
      }
    }
  }
}

output storageAccountName string = storageAccountName
