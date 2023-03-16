resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
    region        = var.region_module
    network       = var.network_name_module

    for_each = var.subnets
        name          = each.key
        ip_cidr_range = each.value
    
    dynamic "secondary_ip_range" {
        for_each = var.secondary_ranges
         content{
            range_name    = secondary_ip_range.key
            ip_cidr_range = secondary_ip_range.value
        }
    }
}
