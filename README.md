# Terraform HCloud Wireguard

![pipeline](https://github.com/cktf/terraform-hcloud-wireguard/actions/workflows/cicd.yml/badge.svg)
![release](https://img.shields.io/github/v/release/cktf/terraform-hcloud-wireguard?display_name=tag)
![license](https://img.shields.io/github/license/cktf/terraform-hcloud-wireguard)

**Wireguard** is a Terraform module useful for creating a wireguard vpn instance in **HCloud** provider

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```bash
terraform init
```

## Usage

```hcl
module "wireguard" {
  source = "cktf/wireguard/hcloud"

  name  = "myvpn"
  peers = ["user1", "user2"]
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This project is licensed under the [MIT](LICENSE.md).  
Copyright (c) KoLiBer (koliberr136a1@gmail.com)
