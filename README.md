# Terraform HCloud Instance

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```sh
git clone https://github.com/unleftie/terraform-hcloud-instance.git
cd terraform-hcloud-instance/
terraform init
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                            | Version |
| --------------------------------------------------------------- | ------- |
| <a name="requirement_hcloud"></a> [hcloud](#requirement_hcloud) | ~> 1    |

## Inputs

| Name                                                                                       | Description                          | Type          | Default                                                | Required |
| ------------------------------------------------------------------------------------------ | ------------------------------------ | ------------- | ------------------------------------------------------ | :------: |
| <a name="input_hcloud_token"></a> [hcloud_token](#input_hcloud_token)                      | n/a                                  | `any`         | n/a                                                    |   yes    |
| <a name="input_knocking_port"></a> [knocking_port](#input_knocking_port)                   | Knocking Port                        | `string`      | `"5200"`                                               |    no    |
| <a name="input_labels"></a> [labels](#input_labels)                                        | Labels for all resources             | `map(string)` | <pre>{<br> "env": "test",<br> "org": "test"<br>}</pre> |    no    |
| <a name="input_network_cidr_block1"></a> [network_cidr_block1](#input_network_cidr_block1) | n/a                                  | `string`      | `"10.10.0.0/16"`                                       |    no    |
| <a name="input_server_location"></a> [server_location](#input_server_location)             | Default Server Location              | `string`      | `"nbg1"`                                               |    no    |
| <a name="input_server_name3"></a> [server_name3](#input_server_name3)                      | n/a                                  | `string`      | n/a                                                    |   yes    |
| <a name="input_server_name4"></a> [server_name4](#input_server_name4)                      | n/a                                  | `string`      | n/a                                                    |   yes    |
| <a name="input_server_name5"></a> [server_name5](#input_server_name5)                      | n/a                                  | `string`      | n/a                                                    |   yes    |
| <a name="input_server_name6"></a> [server_name6](#input_server_name6)                      | n/a                                  | `string`      | n/a                                                    |   yes    |
| <a name="input_service_name"></a> [service_name](#input_service_name)                      | Default Service/Org Name             | `string`      | n/a                                                    |   yes    |
| <a name="input_ssh_public_key_path"></a> [ssh_public_key_path](#input_ssh_public_key_path) | Name of existing SSH public key file | `string`      | `"id_rsa.pub"`                                         |    no    |
| <a name="input_subnet_cidr_block1"></a> [subnet_cidr_block1](#input_subnet_cidr_block1)    | n/a                                  | `string`      | `"10.10.10.0/24"`                                      |    no    |
| <a name="input_vpn_port"></a> [vpn_port](#input_vpn_port)                                  | VPN UDP Port                         | `string`      | `"5200"`                                               |    no    |

<!-- END_TF_DOCS -->

## 📝 License

This project is licensed under the [MIT](LICENSE.md).
