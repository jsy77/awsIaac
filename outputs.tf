output "secrity_group_name" {
  value = aws_security_group.ec2_sg.name

}

output "secrity_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "ec2_instance_name" {
  value = aws_instance.my_ec2.id
}

output "ec2_instance_tags" {
  value = aws_instance.my_ec2.tags_all

}