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

# Ec2 SG load balancer
resource "aws_security_group" "sg_ec2_lb" {
  vpc_id      = aws_vpc.main.id
  name        = "SG_ec2-lb-${terraform.workspace}"
  description = "Public lb security group - ${terraform.workspace}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = ""
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = ""
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "SG_ec2-lb-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}

resource "aws_security_group" "sg_ec2" {
  vpc_id      = aws_vpc.main.id
  name        = "SG_ec2-${terraform.workspace}"
  description = "Private app ec2 security group - ${terraform.workspace}"

  # ingress {
  #   description = ""
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  ingress {
    # TLS (change to whatever ports you need)
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    # cidr_blocks = var.pub_cidr_blocks
    # security_groups = [aws_security_group.sg_ec2_web.id] # SG_WEB group
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    # cidr_blocks = var.pub_cidr_blocks
    # security_groups = [aws_security_group.sg_ec2_web.id]
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "SG_ec2-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}

# RDS DB security group
resource "aws_security_group" "sg_rds" {
  vpc_id      = aws_vpc.main.id
  name        = "SG_rds-${terraform.workspace}"
  description = "RDS DB security group - ${terraform.workspace}"
  ingress {
    # From ebs-ec2 instances
    description     = "From app ec2 instances"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_ec2.id, aws_security_group.sg_bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "SG_rds-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}