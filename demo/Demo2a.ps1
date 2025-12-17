# Create Resource Group
az group create --name rg-azclidemo-002 --location eastus

# Create Virtual Network 
az network vnet create `
--name vnet-azclidemo-eastus-002 `
--resource-group rg-azclidemo-002 `
--address-prefixes 10.0.0.0/16 `
--subnet-name snet-azclidemo-eastus-002 `
--subnet-prefixes 10.0.0.0/24

# Create Storage
az storage account create `
--name stazclidemox002 `
--resource-group rg-azclidemo-002 `
--location eastus `
--sku Standard_LRS `
--kind StorageV2

# Create VM
az vm create `
--name vm-azclidemo-002 `
--resource-group rg-azclidemo-002 `
--vnet-name vnet-azclidemo-eastus-002 `
--subnet snet-azclidemo-eastus-002 `
--image Ubuntu2404 `
--size Standard_B1s `
--admin-user adminuser1 `
--generate-ssh-keys

