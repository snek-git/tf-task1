variable "project_id_module" {
  type    = string
}

variable "network_name_module" {
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

