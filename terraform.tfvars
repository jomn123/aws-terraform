region   = "us-east-1"
name     = "my-vpc"
vpc_cidr = "10.16.0.0/16"

subnets = {
  "web-subnet-a" = {
    cidr_block                       = "10.16.1.0/24"
    assign_ipv6_address_on_creation = true
    availability_zone               = "us-east-1a"
    map_public_ip_on_launch         = true
    tags                             = { tier = "web" }
  }

  "app-subnet-b" = {
    cidr_block                       = "10.16.2.0/24"
    assign_ipv6_address_on_creation = true
    availability_zone               = "us-east-1b"
    map_public_ip_on_launch         = false
    tags                             = { tier = "app" }
  }

  "db-subnet-c" = {
    cidr_block                       = "10.16.3.0/24"
    assign_ipv6_address_on_creation = true
    availability_zone               = "us-east-1c"
    map_public_ip_on_launch         = false
    tags                             = { tier = "db" }
  }
}
