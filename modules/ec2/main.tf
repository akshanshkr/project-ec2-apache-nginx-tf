# resource "aws_instance" "web_instance" {
#   ami                    = var.ami_id
#   instance_type          = var.instance_type
#   key_name               = var.key_name
#   subnet_id              = var.subnet_id
#   security_groups        = [aws_security_group.instance_sg.name]
#   associate_public_ip_address = true

#   user_data = file(var.user_data_file)

#   tags = {
#     Name = "PublicEC2Instance"
#   }
# }
