terraform {
  backend "s3" {
    bucket = "s3-teris"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
