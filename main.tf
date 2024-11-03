module "vpc" {
  source = "./modules/vpc"
  availability_zones = var.availability_zones
  main_vpc_cidr      = var.main_vpc_cidr
  main_vpc_class_b   = var.main_vpc_class_b
}
module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.vpc.subnet_pub_app1
  security_groups = module.vpc.sg_ec2
  
}