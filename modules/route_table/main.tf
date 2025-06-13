resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = var.igw_id
  }

  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "this" {
  for_each = toset(var.route_table_subnet_ids)

  subnet_id      = each.key
  route_table_id = aws_route_table.this.id
}

