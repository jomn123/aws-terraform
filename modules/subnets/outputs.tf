output "subnet_ids" {
  value = { for k, subnet in aws_subnet.this : k => subnet.id }
}
