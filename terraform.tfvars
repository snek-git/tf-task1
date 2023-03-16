project_id                      = "sada-vahan-yeghiazaryan-sanbox"
region                          = "us-central1"
zone                            = "us-central1-c"
network_name                    = "vpc-1"
mtu                             = 1
auto_create_subnetworks         = false
delete_default_routes_on_create = false
subnets                         = {"subnet-1" = "10.184.0.0/16"}
secondary_ranges                = {"range-1" = "172.16.0.0/12",
                                   "range-2" = "192.168.0.0/16"}
allowlist                       = {"tcp" = ["80", "443"] , 
                                   "ssh" = ["22"]}
firewall_name                   = "ingress-firewall"
denylist                        = {}
direction                       = "INGRESS"
source_tags                     = ["web"]
source_ranges                   = [ ]
source_service_accounts         = null
target_tags                     = null
priority                        = null
router_name                     = "tf-router"
router_description              = "router_desc"
bgp                             = [{
    advertise_mode              = "CUSTOM"
    advertised_groups           = [ "ALL_SUBNETS" ]
    asn                         = 65098
    range                       = "1.2.3.4"
}]
nat_name                        = "tf-nat"
drain_nat_ips                   = [ ]
nat_ip_allocate_option          = "MANUAL_ONLY"
nat_ips                         = [ ]
source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
enable_endpoint_independent_mapping = false
log_config = [ {
  enable = false
  filter = "ALL"
} ]

subnetwork = [{
  name = ""
  secondary_ip_range_names = [ "" ]
  source_ip_ranges_to_nat = [ "" ]
}]

rules = [ {
  description = "value"
  match = "value"
  rule_number = 1
  source_nat_active_ips = [ "value" ]
  source_nat_drain_ips = [ "value" ]
} ]