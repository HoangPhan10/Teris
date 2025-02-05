terraform {
  backend "s3" {
    bucket = "s3-teris"
    key    = "Jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
