variable "service_name" {
  type        = string
  default     = "test"
  sensitive   = false
  description = "Service Name"
}

variable "server_name" {
  type        = string
  default     = "server1"
  sensitive   = false
  description = "Server Name"
}

variable "server_image" {
  type        = string
  default     = "debian-11"
  sensitive   = false
  description = "Server Image"
}

variable "server_type" {
  type        = string
  default     = "cpx11"
  sensitive   = false
  description = "Server Type"
}

variable "server_location" {
  type        = string
  default     = "nbg1"
  sensitive   = false
  description = "Server Location"
}

variable "vpn_port" {
  type        = string
  default     = "5200"
  sensitive   = false
  description = "VPN UDP Port"
}

variable "personal_ip1" {
  type      = string
  default   = "10.10.10.1/32"
  sensitive = false
}

variable "ssh_public_key_path1" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  sensitive   = true
  description = "Name of existing SSH public key file (e.g. id_rsa.pub)"
}

variable "network_cidr_block1" {
  type      = string
  default   = "10.10.0.0/16"
  sensitive = false
}

variable "subnet_cidr_block1" {
  type      = string
  default   = "10.10.10.0/24"
  sensitive = false
}

variable "labels" {
  type = map(string)
  default = {
    env = "test"
    org = "test"
  }
  sensitive   = false
  description = "Labels for all resources"
}
