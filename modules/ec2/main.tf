
resource "aws_instance" "web_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  security_groups        = var.security_groups
  associate_public_ip_address = true
   # Load the user data from the external file and pass the web_server variable
  user_data = templatefile("${path.module}/user_data.sh", {
    web_server = var.web_server
    domain_name = var.domain_name
  })
  tags = {
    Name = "create by terra akku"
  }
}
