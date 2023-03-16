variable "network_id_module" {
  type = string
}

variable "firewall_name" {
  type = string
}

variable "allowlist" {
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

variable "denylist" {
  type = map(any)
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