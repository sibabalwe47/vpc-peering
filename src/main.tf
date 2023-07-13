resource "aws_vpc_peering_connection" "this" {
  peer_vpc_id = var.peer_vpc_id
  vpc_id      = var.vpc_id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  # tags = var.tags
}

resource "aws_route" "requester" {
  count                     = length(data.aws_route_tables.owner.ids)
  route_table_id            = tolist(data.aws_route_tables.owner.ids)[count.index]
  destination_cidr_block    = data.aws_vpc.accepter.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

resource "aws_route" "accepter" {
  count                     = length(data.aws_route_tables.accepter.ids)
  route_table_id            = tolist(data.aws_route_tables.accepter.ids)[count.index]
  destination_cidr_block    = data.aws_vpc.owner.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

