provider "aws" {
  region = var.region
}

module "vpc" {
  source   = "./modules/vpc"
  name     = var.name
  vpc_cidr = var.vpc_cidr
}

module "subnets" {
  source     = "./modules/subnet"
  name       = var.name
  vpc_id     = module.vpc.vpc_id
  vpc_ipv6_cidr_block = module.vpc.ipv6_cidr_block
  subnets    = var.subnets
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  name   = var.name
}

module "route_table" {
  source = "./modules/route_table"

  vpc_id = module.vpc.vpc_id
  igw_id = module.internet_gateway.igw_id
  name   = var.name


}


