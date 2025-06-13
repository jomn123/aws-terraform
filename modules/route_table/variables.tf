variable "vpc_id" {
  description = "VPC ID for the route table"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID for default route"
  type        = string
}

variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "route_table_subnet_ids" {
  description = "List of subnet IDs to associate with this route table"
  type        = list(string)
  default     = []
}

