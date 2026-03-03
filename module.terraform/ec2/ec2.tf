



# Create the EC2 instance
resource "aws_instance" "ubuntu" {
  ami           = var.ami0 # Amazon Linux 2 AMI (update for your region)
  instance_type = var.instancetype
  key_name      = var.keyname
  subnet_id = var.sub
  associate_public_ip_address = true

  tags = {
    Name = var.ec2name
  }
}