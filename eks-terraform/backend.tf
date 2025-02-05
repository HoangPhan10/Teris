terraform {
  backend "s3" {
    bucket = "s3-teris-v1"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
