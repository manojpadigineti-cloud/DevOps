module "vpc" {
  for_each = var.vpc_networks
  source = "./modules/vpc"
  vpc_name = each.value.vpc_name
}

module "subnets" {
  for_each = var.subnets
  source = "./modules/subnets"
  subnet_cidr   = each.value.subnet_cidr
  subnet_name   = each.value.subnet_name
  subnet_region = each.value.subnet_region
  vpc_id        = module.vpc["i27ecommerce"].vpc_id
}

module "Public_VM" {
  for_each = var.public_compute
  source = "./modules/public_compute"
  image_name   = ""
  machine_type = ""
  vm_name      = ""
  vpc_name     = ""
  zone         = ""
}

