output "route_table_id" {
  description = "ID of the route table"
  value       = aws_route_table.this.id
}

output "route_table_arn" {
  description = "ARN of the route table"
  value       = aws_route_table.this.arn
}