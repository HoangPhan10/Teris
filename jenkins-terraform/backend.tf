terraform {
  backend "s3" {
    bucket = "s3-tetris"
    key    = "Jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
