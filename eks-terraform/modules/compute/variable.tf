variable "role_arn" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch."
}

variable "image_id" {
  type     = string
  nullable = false
}

variable "key_name" {
  type     = string
  nullable = false
}

variable "subnet_id" {
  type     = string
  nullable = false
}
variable "vpc_sg_public" {
  type     = list(string)
  nullable = false
}

variable "iam_instance_profile" {
  type = string
}
