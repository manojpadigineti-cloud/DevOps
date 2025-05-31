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
  }))
}

variable "password" {
  default = "Manoj@9999"
}