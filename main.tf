
module "vpc_a" {
  source             = "github.com/sibabalwe47/vpc"
  name               = "vpc-a"
  region             = "us-east-1"
  vpc_cidr           = "10.0.0.0/16"
  enable_nat_gateway = false
  single_nat_gateway = false
  tags = {
    Name = "vpc-a"
  }
}

module "vpc_b" {
  source             = "github.com/sibabalwe47/vpc"
  name               = "vpc-b"
  region             = "us-east-1"
  vpc_cidr           = "172.0.0.0/16"
  enable_nat_gateway = false
  single_nat_gateway = false
  tags = {
    Name = "vpc-b"
  }
}


module "vpc_peering" {
  source      = "./src"
  peer_vpc_id = module.vpc_a.vpc_id
  vpc_id      = module.vpc_b.vpc_id


}
