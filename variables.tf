variable "region" {
  description = "AWS region"
  type        = string
}

variable "name" {
  description = "Project name prefix"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnets" {
  description = "Subnet configurations"
  type = map(object({
    cidr_block                      = string
    availability_zone               = string
    assign_ipv6_address_on_creation = bool
    map_public_ip_on_launch         = bool
    tags                            = map(string)
  }))
}

variable "public_subnets" {
  description = "List of public subnet names"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet names"
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = false
}