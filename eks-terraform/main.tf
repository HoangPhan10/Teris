provider "aws" {
  region = var.region
}

resource "aws_key_pair" "keypair" {
  key_name   = "keypair-eks"
  public_key = file("./keypair/keypair.pub")
}

module "networking" {
  source = "./modules/networking"
}

module "security" {
  depends_on = [module.networking]
  source     = "./modules/security"
  vpc_id     = module.networking.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

module "compute" {
  depends_on           = [module.networking, module.security, module.iam]
  source               = "./modules/compute"
  role_arn             = module.iam.eks_cluster_role_arn
  subnet_ids           = module.networking.private_subnet_ips
  node_role_arn        = module.iam.eks_node_role_arn
  vpc_sg_public        = [module.security.sg_k8s_workshop_01]
  key_name             = aws_key_pair.keypair.id
  instance_type        = var.instance_type
  image_id             = var.amis[var.region]
  subnet_id            = module.networking.public_subnet_ips[0]
  iam_instance_profile = module.iam.ec2_instance_profile
}
