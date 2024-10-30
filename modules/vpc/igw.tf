######## IGW ###############
resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "akku-${terraform.workspace}-igw"
    Environment = terraform.workspace
    Maintainer  = "Terraform"
  }
}