//vpc
aws_region         = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
main_vpc_cidr      = "10.1.0.0/16"
main_vpc_class_b   = "10.1"

//ec2 instance 
ami_id = "ami-0866a3c8686eaeeba"
instance_type = "t2.micro"
key_name = "master_home"
web_server = "nginx"

