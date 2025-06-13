provider "aws" {
  region = var.region
}

# VPC
module "vpc" {
  source   = "./modules/vpc"
  name     = var.name
  vpc_cidr = var.vpc_cidr
}

# Subnets
module "subnets" {
  source              = "./modules/subnets"
  name                = var.name
  vpc_id              = module.vpc.vpc_id
  vpc_ipv6_cidr_block = module.vpc.ipv6_cidr_block
  subnets             = var.subnets
}

# Internet Gateway
module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  name   = "${var.name}-igw"
}

# Public Route Table (for web subnets)
module "public_route_table" {
  source = "./modules/route_table"
  
  vpc_id     = module.vpc.vpc_id
  igw_id     = module.internet_gateway.igw_id
  name       = "${var.name}-public"
  subnet_ids = [for name in var.public_subnets : module.subnets.subnet_ids[name]]
}

# NAT Gateway (optional)
module "nat_gateway" {
  source = "./modules/nat_gateway"
  count  = var.enable_nat_gateway ? 1 : 0
  
  name             = "${var.name}-nat"
  public_subnet_id = module.subnets.subnet_ids[var.public_subnets[0]]
  
  depends_on = [module.internet_gateway]
}

# Private Route Table (for app/db subnets - only if NAT is enabled)
module "private_route_table" {
  source = "./modules/route_table"
  count  = var.enable_nat_gateway ? 1 : 0
  
  vpc_id         = module.vpc.vpc_id
  igw_id         = null  # Private subnets don't need direct IGW access
  nat_gateway_id = module.nat_gateway[0].nat_gateway_id
  name           = "${var.name}-private"
  subnet_ids     = [for name in var.private_subnets : module.subnets.subnet_ids[name]]
}