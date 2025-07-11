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
    ports = list(string)
    protocol = string
    source_cidr_range = list(string)
    vpc_name = string
 }))
}

variable "gke_cluster" {
  type = map(object({
    name   = string
    nodepool_name = string
    nodepool_region = string
    region = string
  }))
}


# Cloud SQL
variable "cloudsql_name" {}
variable "databasename" {}
variable "dbuser_name" {}
variable "dbversion" {}
variable "region" {}
variable "tier" {}
