###### outputs ######
output "vpc_id" {
  value = aws_vpc.main.id
}

# subnets
output "subnet_pub_app1" {
  value = aws_subnet.subnet_pub_1.id
}

output "subnet_pub_app2" {
  value = aws_subnet.subnet_pub_2.id
}

# security groups
output "sg_bastion" {
  value = aws_security_group.sg_bastion.id
}

output "sg_bastion_name" {
  value = aws_security_group.sg_bastion.name
}


