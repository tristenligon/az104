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
