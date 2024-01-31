resource "aws_security_group" "mysecuritygroup" {
  name   = "mysg"
  vpc_id = aws_vpc.myvpu-demo.id
  dynamic "ingress" {
    for_each = var.sgports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group_rule" "tcp_removal" {
  count = var.remove_tcp_rule ? 1 : 0

  security_group_id = aws_security_group.mysecuritygroup.id
  
  type        = "ingress"
  from_port   = 65535
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  lifecycle {
    create_before_destroy = true
  }
}
