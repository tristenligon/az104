param storageAccounts_salgntech_name string = 'salgntech'

@allowed([
  'westus3'
  'southcentralus'
  'eastus2'
])
param location string = 'westus3'

@allowed(['Standard_LRS'])
param sku_name string = 'Standard_LRS'

@allowed(['StorageV2'])
param storageAccounts_Kind string = 'StorageV2'


resource storageAccounts_salgntech_name_resource 'Microsoft.Storage/storageAccounts@2023-04-01' = {
  name: storageAccounts_salgntech_name
  location: location
  sku: {
    name: sku_name
    tier: 'Standard'
  }
  kind: storageAccounts_Kind
  properties: {
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    networkAcls: {
      resourceAccessRules: []
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: [
        {
          value: '98.177.177.217'
          action: 'Allow'
        }
      ]
      defaultAction: 'Deny'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource storageAccounts_salgntech_name_default 'Microsoft.Storage/storageAccounts/blobServices@2023-04-01' = {
  parent: storageAccounts_salgntech_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: false
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_salgntech_name_default 'Microsoft.Storage/storageAccounts/fileServices@2023-04-01' = {
  parent: storageAccounts_salgntech_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_salgntech_name_default 'Microsoft.Storage/storageAccounts/queueServices@2023-04-01' = {
  parent: storageAccounts_salgntech_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_salgntech_name_default 'Microsoft.Storage/storageAccounts/tableServices@2023-04-01' = {
  parent: storageAccounts_salgntech_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}
