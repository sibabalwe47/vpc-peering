module "vpc_peering" {
  source      = "./src"
  peer_vpc_id = var.peer_vpc_id
  vpc_id      = var.vpc_id
}
