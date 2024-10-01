variable "hcloud_token" {
  type        = string
  sensitive   = true
  description = "Hetzner Cloud API Token"
}

variable "service_name" {
  type        = string
  description = "Default Service/Org Name"
  default     = "acme"
}

variable "server_name3" {
  type    = string
  default = "server3"
}

variable "server_name4" {
  type    = string
  default = "server4"
}

variable "server_name5" {
  type    = string
  default = "server5"
}

variable "server_name6" {
  type    = string
  default = "server6"
}

variable "server_location" {
  type        = string
  default     = "nbg1"
  description = "Default Server Location"
}

variable "vpn_port" {
  type        = number
  default     = 5200
  description = "VPN UDP Port"

  validation {
    condition     = can(regex("^([0-9]{1,5})$", var.vpn_port)) && tonumber(var.vpn_port) >= 0 && tonumber(var.vpn_port) <= 65535
    error_message = "The vpn_port must be a valid port number between 0 and 65535."
  }
}

variable "knocking_ports_range" {
  type        = list(number)
  default     = [5200, 5300]
  sensitive   = true
  description = "Knocking Ports Range"

  validation {
    condition     = can(regex("^([0-9]{1,5})$", var.knocking_ports_range[0])) && can(regex("^([0-9]{1,5})$", var.knocking_ports_range[1])) && var.knocking_ports_range[0] <= var.knocking_ports_range[1]
    error_message = "The knocking_ports_range must be a valid range of port numbers."
  }
}

variable "ssh_public_key_path" {
  type        = string
  description = "Name of existing SSH public key file"
  default     = "id_rsa.pub"
}

variable "network_cidr_block1" {
  type        = string
  default     = "10.10.0.0/16"
  description = "CIDR block for the network"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.network_cidr_block1))
    error_message = "The network_cidr_block1 must be a valid CIDR block."
  }
}

variable "subnet_cidr_block1" {
  type        = string
  default     = "10.10.10.0/24"
  description = "CIDR block for the subnet"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.subnet_cidr_block1))
    error_message = "The subnet_cidr_block1 must be a valid CIDR block."
  }
}

variable "labels" {
  type        = map(string)
  description = "Labels for all resources"
  default = {
    env = "dev"
    org = "acme"
  }
}
