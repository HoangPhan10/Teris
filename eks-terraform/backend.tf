terraform {
  backend "s3" {
    bucket = "s3-tetris-terraform"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
