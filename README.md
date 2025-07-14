# hcloud-infra

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```sh
git clone https://github.com/unleftie/hcloud-infra.git
cd hcloud-infra/
terraform init
terraform apply -var="hcloud_token=your-hcloud-token"
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                            | Version |
| --------------------------------------------------------------- | ------- |
| <a name="requirement_hcloud"></a> [hcloud](#requirement_hcloud) | 1.51.0  |

## Inputs

| Name                                                                                          | Description                          | Type           | Default                                                  | Required |
| --------------------------------------------------------------------------------------------- | ------------------------------------ | -------------- | -------------------------------------------------------- | :------: |
| <a name="input_hcloud_token"></a> [hcloud_token](#input_hcloud_token)                         | Hetzner Cloud API Token              | `string`       | n/a                                                      |   yes    |
| <a name="input_knocking_ports_range"></a> [knocking_ports_range](#input_knocking_ports_range) | Knocking Ports Range                 | `list(number)` | <pre>[<br/> 5200,<br/> 5300<br/>]</pre>                  |    no    |
| <a name="input_labels"></a> [labels](#input_labels)                                           | Labels for all resources             | `map(string)`  | <pre>{<br/> "env": "dev",<br/> "org": "acme"<br/>}</pre> |    no    |
| <a name="input_network_cidr_block1"></a> [network_cidr_block1](#input_network_cidr_block1)    | CIDR block for the network           | `string`       | `"10.10.0.0/16"`                                         |    no    |
| <a name="input_server_location"></a> [server_location](#input_server_location)                | Default Server Location              | `string`       | `"nbg1"`                                                 |    no    |
| <a name="input_server_name3"></a> [server_name3](#input_server_name3)                         | n/a                                  | `string`       | `"server3"`                                              |    no    |
| <a name="input_server_name6"></a> [server_name6](#input_server_name6)                         | n/a                                  | `string`       | `"server6"`                                              |    no    |
| <a name="input_service_name"></a> [service_name](#input_service_name)                         | Default Service/Org Name             | `string`       | `"acme"`                                                 |    no    |
| <a name="input_ssh_public_key_path"></a> [ssh_public_key_path](#input_ssh_public_key_path)    | Name of existing SSH public key file | `string`       | `"id_rsa.pub"`                                           |    no    |
| <a name="input_subnet_cidr_block1"></a> [subnet_cidr_block1](#input_subnet_cidr_block1)       | CIDR block for the subnet            | `string`       | `"10.10.10.0/24"`                                        |    no    |
| <a name="input_vpn_ports"></a> [vpn_ports](#input_vpn_ports)                                  | VPN UDP Ports                        | `list(number)` | <pre>[<br/> 5200<br/>]</pre>                             |    no    |

<!-- END_TF_DOCS -->

## 📝 License

This project is licensed under the [MIT](LICENSE.md).
