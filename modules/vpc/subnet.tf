resource "aws_subnet" "subnet_pub_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.1.0/24"
  availability_zone = var.availability_zones[0]

  tags = {
    Name        = "app-pub-subnet-1-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}
resource "aws_subnet" "subnet_pub_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.main_vpc_class_b}.2.0/24"
  availability_zone = var.availability_zones[1]
  tags = {
    Name        = "app-pub-subnet-2-${terraform.workspace}"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}
