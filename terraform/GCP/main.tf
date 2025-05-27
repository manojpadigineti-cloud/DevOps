module "vpc" {
  for_each = var.vpc_networks
  source = "./modules/vpc"
  vpc_name = each.value.vpc_name
}