variable "vpc_id" {
  type = string
}

variable "vpc_ipv6_cidr_block" {
  type = string
}

variable "name" {
  type = string
}

variable "subnets" {
  type = map(object({
    cidr_block                      = string
    availability_zone               = string
    assign_ipv6_address_on_creation = bool
    map_public_ip_on_launch         = bool
    tags                            = map(string)
  }))
}
