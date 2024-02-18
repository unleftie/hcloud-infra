data "http" "cloudflare_ips_v4" {
  url = "https://www.cloudflare.com/ips-v4"
}

data "http" "cloudflare_ips_v6" {
  url = "https://www.cloudflare.com/ips-v6"
}

data "hcloud_ssh_keys" "this" {
  with_selector = "managed=terraform"
}

data "hcloud_image" "snapshot1" {
  with_selector     = "app=snapshot1"
  most_recent       = true
  with_architecture = "x86"
}
