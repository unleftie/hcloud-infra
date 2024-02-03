variable "hcloud_token" {
  sensitive = true
}

variable "service_name" {
  type        = string
  description = "Default Service/Org Name"
}

variable "server_name3" {
  type = string
}

variable "server_name4" {
  type = string
}

variable "server_name5" {
  type = string
}

variable "server_location" {
  type        = string
  default     = "nbg1"
  description = "Default Server Location"
}

variable "vpn_port" {
  type        = string
  default     = "5200"
  description = "VPN UDP Port"
}

variable "knocking_port" {
  type        = string
  default     = "5200"
  sensitive   = true
  description = "Knocking Port"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Name of existing SSH public key file"
  default     = "id_rsa.pub"
}

variable "network_cidr_block1" {
  type    = string
  default = "10.10.0.0/16"
}

variable "subnet_cidr_block1" {
  type    = string
  default = "10.10.10.0/24"
}

variable "labels" {
  type = map(string)
  default = {
    env = "test"
    org = "test"
  }
  description = "Labels for all resources"
}
