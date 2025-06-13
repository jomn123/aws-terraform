variable "vpc_id" {
  description = "ID of the VPC to attach the Internet Gateway to"
  type        = string
}

variable "name" {
  description = "Name prefix for the Internet Gateway"
  type        = string
}
