terraform {
  backend "s3" {
    bucket = "s3-teris-v1"
    key    = "Jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
