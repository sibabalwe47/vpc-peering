
data "aws_vpc" "accepter" {
  id = var.peer_vpc_id
}

data "aws_route_tables" "accepter" {
  vpc_id = data.aws_vpc.accepter.id
}
data "aws_vpc" "owner" {
  id = var.vpc_id
}

data "aws_route_tables" "owner" {
  vpc_id = var.vpc_id
}
N

