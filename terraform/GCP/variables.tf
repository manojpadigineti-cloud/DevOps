variable "vpc_networks" {
  type = map(object({
    vpc_name = string
  }))
}