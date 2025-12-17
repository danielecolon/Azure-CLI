# Create VM
az vm create `
--name vm-azclidemo-001 `
--resource-group rg-azclidemo-001 `
--vnet-name vnet-azclidemo-eastus-001 `
--subnet snet-azclidemo-eastus-001 `
--image Ubuntu2404 `
--size Standard_B1s `
--admin-user adminuser1 `
--generate-ssh-keys

