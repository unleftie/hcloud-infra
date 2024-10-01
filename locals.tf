locals {
  knocking_ports = join("-", tolist(var.knocking_ports_range))
}
