resource "google_compute_router_nat" "nat" {
  name                                = var.nat_name
  router                              = var.router_name
  region                              = var.region
  nat_ip_allocate_option              = var.nat_ip_allocate_option
  nat_ips                             = var.nat_ips
  source_subnetwork_ip_ranges_to_nat  = var.source_subnetwork_ip_ranges_to_nat
  enable_endpoint_independent_mapping = var.enable_endpoint_independent_mapping
  drain_nat_ips                       = var.drain_nat_ips

  dynamic "log_config" {
    for_each = var.log_config
    content {
      enable = log_config.value.enable
      filter = log_config.value.filter
    }
  }

  dynamic "subnetwork" {
    for_each = var.subnetwork
    content {
      name                     = subnetwork.value.name
      source_ip_ranges_to_nat  = subnetwork.value.source_ip_ranges_to_nat
      secondary_ip_range_names = subnetwork.value.secondary_ip_range_names
    }
  }

  dynamic "rules" {
    for_each = var.rules
    content {
      rule_number = rules.value.rule_number
      description = rules.value.description
      match       = rules.value.match
      dynamic "action" {
        for_each = var.rules
        content {
          source_nat_active_ips = rules.value.source_nat_active_ips
          source_nat_drain_ips  = rules.value.source_nat_drain_ips
        }
      }
    }
  }
}
