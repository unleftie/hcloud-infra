terraform {
  required_version = ">= 1.12"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.60.1"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}
