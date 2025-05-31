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

module "firewall" {
  for_each = var.firewalls
  source = "./modules/firewall"
  firewall_name     = each.value.firewall_name
  vpc_name          = each.value.vpc_name
  firewall_ports = each.value.firewall_ports
}

module "tls_keys" {
  source = "./modules/ssh_keys"
}

module "compute" {
  depends_on = [module.tls_keys, module.subnets, module.firewall]
  for_each = var.public_compute
  source = "./modules/public_compute"
  image_name   = each.value.image_name
  machine_type = each.value.machine_type
  vm_name      = each.value.vm_name
  vpc_name     = each.value.vpc_name
  zone         = each.value.zone
  private_key = module.tls_keys.rsa_private_key
  public_key = module.tls_keys.rsa_public_key
  subnet = each.value.subnet
}

module "local_file" {
  source = "./modules/local_download"
  content         = module.tls_keys.rsa_private_key
  local_file_name = "id_rsa"
}

module "provisioner" {
  depends_on = [module.compute]
  for_each = var.public_compute
  source = "./modules/provisioner"
  remote_host  = module.compute[each.key].compute_public_ip
  run_server   = each.value.vm_name
  ssh_password = var.password
}