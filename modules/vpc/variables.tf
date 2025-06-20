variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type     = string
}

variable "name" {
    description = "Name prefix for the VPC and its resources"
    type = string
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Auto-assign an IPv6 CIDR block"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
    description = "Choose between default or dedicated"
    type = string
    default = "default"
}