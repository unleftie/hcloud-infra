terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.51.0"
    }
  }
  cloud {
    organization = "determined_buck"

    workspaces {
      project = "hcloud-infra"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}
