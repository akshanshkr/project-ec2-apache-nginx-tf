//vpc
# variable "aws_region" {}
variable "availability_zones" {}
variable "main_vpc_cidr" {}
variable "main_vpc_class_b" {}


variable "instance_type" {
  description = "EC2 Instnace Type"
  type        = string
  default     = "t3.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type        = string
  default     = "akku_key"
}
variable "aws_region" {
    description = "aws region"
    type = string
    default = "us-east-1"
  
}
variable "web_server"{
  description = "webserver apache or nginx"
  type = string
  default = "apache2"
}

variable "ami_id"{}
variable "key_name"{}

variable "domain_name" {
  description = "The domain name for the Route 53 record"
  type        = string
}

variable "hosted_zone_id" {
  description = "The hosted zone ID in Route 53 where the record will be created"
  type        = string
}

