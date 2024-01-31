resource "aws_instance" "my_ec2_instance" {
  ami                    = var.aws_ami_id
  instance_type          = "t2.micro"
  key_name               = "mykey"
  count                  = length(var.subnets_cidr)
  subnet_id              = element(aws_subnet.main.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.mysecuritygroup.id]
  tags = {
    "Name" = "my-ec2.${count.index+1}"
  }
}
