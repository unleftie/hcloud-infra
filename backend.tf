terraform {
  cloud {
    organization = "determined_buck"

    workspaces {
      project = "hcloud-infra"

      tags = {
        layer = "networking"
      }
    }
  }
}
