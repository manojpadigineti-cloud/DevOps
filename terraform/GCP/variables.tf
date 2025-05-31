variable "vpc_networks" {
  type = map(object({
    vpc_name = string
  }))
}

variable "subnets" {
  type = map(object({
    subnet_cidr = string
    subnet_name = string
    subnet_region = string
  }))
}

variable "public_compute" {
  type = map(object({
    image_name = string
    machine_type = string
    vm_name = string
    vpc_name = string
    zone = string
    subnet = string
  }))
}

variable "password" {
  default = "Manoj@9999"
}

variable "firewalls" {
  type = map(object({
    firewall_name = string
    vpc_name = string
    firewall_ports = map(object({
       source_cidr_range = list(string)
       protocol = string
       ports = list(string)
    }))
  }))
}