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
  depends_on = [module.vpc]
  for_each = var.firewalls
  source = "./modules/firewall"
  firewall_name     = each.value.firewall_name
  ports             = each.value.ports
  protocol          = each.value.protocol
  source_cidr_range = each.value.source_cidr_range
  vpc_name          = module.vpc[each.value.vpc_name].vpc_id
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

//ALLOW NETWORK CONNECTIVITY IN CLOUDSQL
module "cloudsql" {
  source = "./modules/cloudsql"
  cloudsql_name = var.cloudsql_name
  databasename  = var.databasename
  dbuser_name   = var.dbuser_name
  dbversion     = var.dbversion
  region        = var.region
  tier          = var.tier
  user_password = var.password
}

module "gke" {
  source = "./modules/gke"
  for_each = var.gke_cluster
  name   = each.value.name
  nodepool_name = each.value.nodepool_name
  nodepool_region = each.value.nodepool_region
  region = each.value.region
}