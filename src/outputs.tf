
output "aws_vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.this.id
}

output "accepter_status" {
  value = aws_vpc_peering_connection.this.accept_status
}
