provider "aws" {
  region = var.aws_region
}


resource "aws_instance" "private_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.private_sg]
  
  
  subnet_id              = var.subnet_id

  associate_public_ip_address = false
  key_name                    = var.key_name

  root_block_device {

    volume_size = 8

    volume_type = "gp3"

    delete_on_termination = true

    encrypted = true

  }

  tags = {
    Name        = var.instance_name
    Environment = "dev"
    usedfor     = var.usedfor


  }

}