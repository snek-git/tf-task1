provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}


module "network" {
  source                          = "./modules/network/"
  project_id_module               = var.project_id
  network_name_module             = var.network_name
  auto_create_subnetworks         = var.auto_create_subnetworks
  mtu                             = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
}


module "subnetwork" {
  source              = "./modules/subnetwork"
  network_name_module = module.network.network_name_out
  region_module       = var.region
  subnets             = var.subnets
  secondary_ranges    = var.secondary_ranges

}


module "firewall" {
  source                  = "./modules/firewall"
  network_id_module       = module.network.network_name_out
  firewall_name           = var.firewall_name
  allowlist               = var.allowlist
  denylist                = var.denylist
  source_tags             = var.source_tags
  source_ranges           = var.source_ranges
  source_service_accounts = var.source_service_accounts
  target_tags             = var.target_tags
  direction               = var.direction
  priority                = var.priority
}


module "nat" {
  source                              = "./modules/nat"
  nat_name                            = var.nat_name
  project                             = var.project_id
  drain_nat_ips                       = var.drain_nat_ips
  router_name                         = var.router_name
  region                              = var.region
  nat_ip_allocate_option              = var.nat_ip_allocate_option
  nat_ips                             = var.nat_ips
  source_subnetwork_ip_ranges_to_nat  = var.source_subnetwork_ip_ranges_to_nat
  enable_endpoint_independent_mapping = var.enable_endpoint_independent_mapping
  log_config                          = var.log_config
  subnetwork                          = var.subnetwork
  rules                               = var.rules
}