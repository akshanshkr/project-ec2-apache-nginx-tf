# ########### NAT ##############
# resource "aws_eip" "nat" {}

# # single NAT in 1 az
# resource "aws_nat_gateway" "main-natgw" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.subnet_pub_1.id
#   depends_on    = [aws_internet_gateway.main-igw]

#   tags = {
#     Name        = "akku-${terraform.workspace}-nat"
#     Environment = terraform.workspace
#     Maintainer  = "Terraform"
#   }
# }