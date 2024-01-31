resource "aws_vpc" "myvpu-demo" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "myvpc"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpu-demo.id

  tags = {
    Name = "igw"
  }
}
resource "aws_subnet" "main" {
  count = length(var.subnets_cidr)
  vpc_id     = aws_vpc.myvpu-demo.id
  cidr_block = element(var.subnets_cidr , count.index)
  availability_zone = element(var.azs , count.index)
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Subnet-${count.index +1}"
  }
}
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpu-demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "mypublicRT"
  }
}
resource "aws_route_table_association" "RTA" {
  count = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.main.*.id, count.index)
  route_table_id = aws_route_table.RT.id
}
