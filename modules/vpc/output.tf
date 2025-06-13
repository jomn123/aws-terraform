output "vpc_id" {
  value = aws_vpc.this.id
}

output "ipv6_cidr_block" {
  value = aws_vpc.this.ipv6_cidr_block
}
