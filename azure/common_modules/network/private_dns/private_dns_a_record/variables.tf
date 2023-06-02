variable "private_dns_zone_name" {
  type        = string
  description = "Private DNS zone name"
}

variable "private_dns_a_record" {
  type        = string
  description = "Private DNS A record name"
}

variable "dns_records" {
  type        = list(any)
  description = "IP address/dns record of the application/container"
}

variable "resource_group" {
  type        = string
  description = "Resource group name"
}

variable "ttl" {
  type        = number
  description = "DNS TTL (time to live)  e.g 300"
}