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
    image_name = ""
    machine_type = ""
    vm_name = ""
    vpc_name = ""
    zone = ""
  }))
}