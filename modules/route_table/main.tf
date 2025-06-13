resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  # Route for Internet Gateway (public subnets)
  dynamic "route" {
    for_each = var.igw_id != null ? [1] : []
    content {
      cidr_block = "0.0.0.0/0"
      gateway_id = var.igw_id
    }
  }

  # Route for NAT Gateway (private subnets)
  dynamic "route" {
    for_each = var.nat_gateway_id != null ? [1] : []
    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = var.nat_gateway_id
    }
  }

  # IPv6 route (if IGW exists)
  dynamic "route" {
    for_each = var.igw_id != null ? [1] : []
    content {
      ipv6_cidr_block = "::/0"
      gateway_id      = var.igw_id
    }
  }

  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "this" {
  count = length(var.subnet_ids)

  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.this.id
}

