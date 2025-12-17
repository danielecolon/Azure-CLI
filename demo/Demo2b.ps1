# Variables
$RANDOM = (get-random).ToString().Substring(0,5)
$PROJECT = "azclidemo"
$LOCATION = "eastus"

# Create Resource Group
az group create --name rg-$PROJECT-$RANDOM --location $LOCATION  -o none --only-show-errors
az group show -n rg-$PROJECT-$RANDOM  -o tsv --query name

# Create Virtual Network 
az network vnet create `
--name vnet-$PROJECT-$LOCATION-$RANDOM `
--resource-group rg-$PROJECT-$RANDOM `
--address-prefixes 10.0.0.0/16 `
--subnet-name snet-$PROJECT-$LOCATION-$RANDOM `
--subnet-prefixes 10.0.0.0/24 `
--only-show-errors -o none
az network vnet show -n vnet-$PROJECT-$LOCATION-$RANDOM -g rg-$PROJECT-$RANDOM -o tsv --query name

# Create Storage
az storage account create `
--name st$PROJECT$RANDOM `
--resource-group rg-$PROJECT-$RANDOM `
--location $LOCATION `
--sku Standard_LRS `
--kind StorageV2 `
--only-show-errors -o none
az storage account show -n st$PROJECT$RANDOM -g rg-$PROJECT-$RANDOM -o tsv --query name

# Create VM
az vm create `
--name vm-$RANDOM `
--resource-group rg-$PROJECT-$RANDOM `
--image Ubuntu2404 `
--vnet-name vnet-$PROJECT-$LOCATION-$RANDOM `
--subnet snet-$PROJECT-$LOCATION-$RANDOM `
--admin-user adminuser1 `
--generate-ssh-keys `
--size Standard_B1s `
--only-show-errors -o none
#vm name with the public ip address
az vm list-ip-addresses -n vm-$RANDOM -g rg-$PROJECT-$RANDOM --query "[].{VMName:virtualMachine.name, PublicIP:virtualMachine.network.publicIpAddresses[0].ipAddress}" -o tsv
#vm name only
#az vm show -n vm-$RANDOM -g rg-$PROJECT-$RANDOM  -o tsv --query name




