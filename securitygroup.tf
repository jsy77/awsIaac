resource "aws_security_group" "ec2_sg" {
  description = "public-client-sg"
  vpc_id      = var.vpc_id
  name        = var.sg_name

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["103.81.27.159/32"]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["103.81.27.159/32"]
  }

  egress {
    description = "Allow All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name               = var.sg_name
    ResourceAttachedto = var.instance_name
    usedfor            = var.usedfor
  }

}