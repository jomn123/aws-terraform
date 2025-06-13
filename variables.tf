variable "region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = ""
}

variable "name" {
  description = "A name prefix for tagging and naming resources"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "subnets" {
  description = "Map of subnet configurations keyed by name"
  type = map(object({
    cidr_block                      = string
    assign_ipv6_address_on_creation = bool
    availability_zone               = string
    map_public_ip_on_launch         = bool
    tags                            = map(string)
  }))
  default = {}
}

variable "route_table_subnet_names" {
  description = "List of subnet names to associate with the route table"
  type        = list(string)
  default     = []
}
