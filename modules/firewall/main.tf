resource "google_compute_firewall" "default" {
  name    = var.firewall_name
  network = var.network_id_module

  dynamic "allow" {
    for_each = var.allowlist
    content {
      protocol = allow.key
      ports    = allow.value
    }
  }

  dynamic "deny" {
    for_each = var.denylist
    content {
      protocol = deny.key
      ports    = deny.value
    }
  }

  direction               = var.direction
  source_tags             = var.source_service_accounts == [""] ? var.source_tags : null
  source_service_accounts = var.source_tags == [""] ? var.source_service_accounts : null
  source_ranges           = var.source_ranges
  target_tags             = var.target_tags
  priority                = var.priority
}
