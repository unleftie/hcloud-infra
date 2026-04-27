terraform {
  required_version = ">= 1.12"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.61.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}
