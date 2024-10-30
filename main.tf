module "vpc" {
  source = "./modules/vpc"
  availability_zones = var.availability_zones
  main_vpc_cidr      = var.main_vpc_cidr
  main_vpc_class_b   = var.main_vpc_class_b
}
# module "ec2" {
#   source = "./modules/ec2"
  
# }