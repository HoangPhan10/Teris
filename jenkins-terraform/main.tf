provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "keypair" {
  key_name   = "keypair-tetris"
  public_key = file("./keypair/keypair.pub")
}

module "security" {
  source = "./modules/security"
}

module "compute" {
  depends_on    = [aws_key_pair.keypair, module.security]
  source        = "./modules/compute"
  key_name      = aws_key_pair.keypair.key_name
  id_sg_jenkins = module.security.id_sg_jenkins
}
