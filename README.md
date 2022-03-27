# Azure Front Door

## Instructions

### Parameter Values

| Name     | Description                                                                                  | Value                         | Examples                                                             |
| -------- | -------------------------------------------------------------------------------------------- | ----------------------------- | -------------------------------------------------------------------- |
| tags     | Az Resources tags                                                                            | object                        | `{ key: value }`                                                     |
| location | Az Resources deployment location. To get Az regions run `az account list-locations -o table` | string [default: rg location] | `eastus` \| `centralus` \| `westus` \| `westus2` \| `southcentralus` |
| fd_n     | Front Door Name                                                                              | string [required]             |                                                                      |

### [Reference Examples][1]

## Locally test Azure Bicep Modules

```bash
# Create an Azure Resource Group
az group create \
--name 'rg-azure-bicep-front-door' \
--location 'eastus2' \
--tags project=bicephub env=dev

# Deploy Sample Modules
az deployment group create \
--resource-group 'rg-azure-bicep-front-door' \
--mode Complete \
--template-file examples/examples.bicep
```

[1]: ./examples/examples.bicep
