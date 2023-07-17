
output "aws_vpc_peering_connection_id" {
  value = module.vpc_peering.aws_vpc_peering_connection_id
}

output "accepter_status" {
  value = module.vpc_peering.accepter_status
}
