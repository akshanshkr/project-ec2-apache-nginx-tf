# Create SG_bastion security group
resource "aws_security_group" "sg_bastion" {
  vpc_id      = aws_vpc.main.id
  name        = "SG_bastion-${terraform.workspace}"
  description = "Bastion host security group - ${terraform.workspace}"

  ingress {
    description = ""
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "SG_bastion-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}
