variable "vpc_id" {
  description = "VPC ID for the route table"
  type        = string
}

variable "name" {
  description = "Name for the route table"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with this route table"
  type        = list(string)
}

variable "igw_id" {
  description = "Internet Gateway ID for public routes"
  type        = string
  default     = null
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID for private routes"
  type        = string
  default     = null
}