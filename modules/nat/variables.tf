variable "nat_name" {
  type = string
}

variable "project" {
  type = string
}

variable "drain_nat_ips" {
  type    = list(string)
  default = []
}

variable "router_name" {
  type = string
}

variable "region" {
  type = string
}

variable "nat_ip_allocate_option" {
  type = string
}

variable "nat_ips" {
  type = list(string)
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
    name                     = string
    source_ip_ranges_to_nat  = list(string)
    secondary_ip_range_names = list(string)
  }))
}

variable "rules" {
  type = list(object({
    rule_number           = number
    description           = string
    match                 = string
    source_nat_active_ips = list(string)
    source_nat_drain_ips  = list(string)
  }))
}