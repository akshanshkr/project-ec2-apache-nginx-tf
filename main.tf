module "vpc" {
  source = "./modules/vpc"
  availability_zones = var.availability_zones
  main_vpc_cidr      = var.main_vpc_cidr
  main_vpc_class_b   = var.main_vpc_class_b
}
module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  associate_public_ip_address = true
  subnet_id = module.vpc.subnet_pub_app1
  security_groups = [module.vpc.sg_bastion]
  web_server = var.web_server  # Set to "nginx" to install Nginx instead
  
}