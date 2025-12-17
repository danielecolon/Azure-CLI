# Create Virtual Network 
az network vnet create `
--name vnet-demo-eastus-001 `
--resource-group rg-azclidemo-001 `
--address-prefixes 10.0.0.0/16 `
--subnet-name snet-demo-eastus-001 `
--subnet-prefixes 10.0.0.0/24
