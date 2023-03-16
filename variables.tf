variable "project_id" {
  type = string
}

variable "zone" {
  type = string
}

variable "region" {
  type = string
}

variable "network_name" {
  type = string
}

variable "auto_create_subnetworks" {
 type  = bool 
}

variable "mtu" {
  type = number
}

variable "delete_default_routes_on_create" {
  type = bool
}

variable "subnets" {
  type = map(any)
}

variable "secondary_ranges" {
  type = map(any)
}

variable "firewall_name" {
  type = string
}

variable "allowlist" {
  type = map(any)
}

variable "denylist"{
  type = map(any)
}

variable "source_tags" {
  type = list(string)
}

variable "source_ranges"{
  type = list(string)
}

variable "source_service_accounts" {
    type = list(string)
}

variable "target_tags" {
  type = list(string)
}

variable "direction" {
  type = string
}

variable "priority" {
  type = string
}

variable "router_name" {
  type = string
}

variable "router_description" {
  type = string 
}

variable "bgp" {
    type = list(object({
        asn = number
        advertise_mode = string
        advertised_groups = list(string)
        range = string
  }))
}

variable "nat_name" {
  type = string
}

variable "drain_nat_ips" {
  type = list(string)
}

variable "nat_ip_allocate_option" {
  type = string
}

variable "nat_ips" {
  type = list
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type = string
}

variable "enable_endpoint_independent_mapping" {
  type = bool
}

variable "log_config" {
  type = list(object({
    enable = bool
    filter = string
  }))
}

variable "subnetwork" {
  type = list(object({
    name =  string
    source_ip_ranges_to_nat = list(string)
    secondary_ip_range_names = list(string)
  }))
}

variable "rules" {
  type = list(object({
    rule_number = number
    description = string
    match = string
    source_nat_active_ips = list(string)
    source_nat_drain_ips = list(string)
  }))
}