variable "subnet_id"{}
variable "security_groups"{}
resource "aws_instance" "web_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  security_groups        = var.security_groups
  associate_public_ip_address = true

#   user_data = file(var.user_data_file)

  tags = {
    Name = "create by terra akku"
  }
}
