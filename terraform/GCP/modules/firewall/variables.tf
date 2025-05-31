variable "firewall_name" {}
variable "vpc_name" {}
variable "firewall_ports" {
  type = map(object({
    protocol = string
    ports = list(string)
    source_cidr_range = list(string)
  }))
}