variable "region" {
  type = string
  default = "us-east-1"
}

variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-04b4f1a9cf54c11d0"
  }
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch."
  default     = "t2.medium"
}