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
  default     = "advskill-key"
}
variable "aws_region" {
    description = "aws region"
    type = string
    default = "us-east-1"
  
}
