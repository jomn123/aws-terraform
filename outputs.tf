output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}

output "internet_gateway_id" {
  value = module.internet_gateway.igw_id
}

output "nat_gateway_ip" {
  value = var.enable_nat_gateway ? module.nat_gateway[0].public_ip : null
}