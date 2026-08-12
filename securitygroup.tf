resource "aws_security_group" "ec2_sg" {
  description = "${var.description}-sg"
  vpc_id      = var.vpc_id
  name        = var.sg_name

  

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