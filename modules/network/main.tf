resource "google_compute_network" "vpc_network" {
  project                         = var.project_id_module
  name                            = var.network_name_module
  auto_create_subnetworks         = var.auto_create_subnetworks
  mtu                             = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
}