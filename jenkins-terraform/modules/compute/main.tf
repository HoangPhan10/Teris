resource "aws_iam_role" "role_iam_jenkins" {
  name               = "role-iam-jenkins"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "example_attachment" {
  role       = aws_iam_role.role_iam_jenkins.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "example_profile" {
  name = "Jenkins-terraform-02"
  role = aws_iam_role.role_iam_jenkins.name
}

resource "aws_instance" "web" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = "t2.xlarge"
  key_name               = var.key_name
  vpc_security_group_ids = [var.id_sg_jenkins]
  user_data              = templatefile("modules/compute/script/install_jenkins.sh", {})
  iam_instance_profile   = aws_iam_instance_profile.example_profile.name

  tags = {
    Name = "Jenkins"
  }

  root_block_device {
    volume_size = 85
  }
}
