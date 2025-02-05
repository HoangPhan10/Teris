module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.availability_zone
  private_subnets = var.private_subnet_ips
  public_subnets  = var.public_subnet_ips

  enable_nat_gateway = true
  enable_vpn_gateway = false
  single_nat_gateway = true
  tags = {
    Terraform   = "true"
    Environment = "DEV"
  }
}
