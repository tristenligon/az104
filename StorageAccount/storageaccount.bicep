@minLength(8)
@maxLength(28)
@description('Defines the Storage Account Name')
param name string = 'saligontech1'

@description('Specifies the location')
param location string = 'west_us'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
