# Azure Front Door

## Instructions

### Parameter Values

| Name                       | Description                                                                                  | Value                         | Examples                                                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------- | ----------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| tags                       | Az Resources tags                                                                            | object                        | `{ key: value }`                                                                                                      |
| location                   | Az Resources deployment location. To get Az regions run `az account list-locations -o table` | string [default: rg location] | `eastus` \| `centralus` \| `westus` \| `westus2` \| `southcentralus`                                                  |
| fd_n                       | Front Door Name                                                                              | string [required]             |                                                                                                                       |

| agw_enable_autoscaling     | Application Gateway Enable Autoscaling. Standard_v2 & WAF_V2 supports autoscaling            | string [default: `false`]     | `true` \| `false`                                                                                                     |
| agw_enable_zone_redundancy | Application Gateway Enable Zone Redundancy Flag                                              | string [default: `false`]     | `true` \| `false`                                                                                                     |
| agw_sku                    | Application Gateway sku size                                                                 | string [required]             | `Standard_Small` \| `Standard_Medium` \| `Standard_Large` \| `WAF_Medium` \| `WAF_Large` \| `Standard_v2` \| `WAF_v2` |
| agw_tier                   | Application Gateway tier type                                                                | string [required]             | `Standard` \| `WAF` \| `Standard_v2` \| `WAF_v2`                                                                      |
| agw_capacity               | Application Gateway initial capacity                                                         | int [default: `1`]            |                                                                                                                       |
| agw_max_capacity           | Application Gateway initial capacity                                                         | int [default: `10`]           |                                                                                                                       |
| snet_agw_id                | Application Gateway deployment subnet ID                                                     | string  [required]            |                                                                                                                       |
| snet_agw_addr              | Application Gateway deployment subnet Address space                                          | string                        | `192.168.0.24`                                                                                                        |
| agw_backend_app_names      | BackendPool App Services Names                                                               | string  [required]            | `appA,appB,appC` \| `appA` \| `appA,appB`                                                                             |
| agw_front_end_ports        | Application Gateway Front End Ports                                                          | string  [required]            | `8080,80,8081` \| `8080` \| `8080,8081`                                                                               |
| agw_pip_n                  | Application Gateway Public Ip Name                                                           | string  [required]            | `8080,80,8081` \| `8080` \| `8080,8081`                                                                               |

### Conditional Parameter Values

Application Gateway Combinations:

- `Standard`
  - SKU Tier:
    - `Standard_Small`
    - `Standard_Medium`
    - `Standard_Large`
  - agw_capacity: [1,32]
- `WAF`
  - SKU Tier:
    - `WAF_Medium`
    - `WAF_Large`
  - agw_capacity: [1,32]
- `Standard_v2`
  - SKU Tier:
    - `Standard_v2`
  - agw_enable_autoscaling available
  - agw_capacity: [0,125]
- `WAF_v2`
  - SKU Tier:
    - `WAF_v2`
  - agw_enable_autoscaling available
  - agw_capacity: [0,125]

### [Reference Examples][1]

## Locally test Azure Bicep Modules

```bash
# Create an Azure Resource Group
az group create \
--name 'rg-azure-bicep-application-gateway' \
--location 'eastus2' \
--tags project=bicephub env=dev

# Deploy Sample Modules
az deployment group create \
--resource-group 'rg-azure-bicep-application-gateway' \
--mode Complete \
--template-file examples/examples.bicep
```

[1]: ./examples/examples.bicep
