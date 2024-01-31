variable "aws_region"{    
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "subnets_cidr" {
    type = list
    default = [ "10.0.1.0/24", "10.0.2.0/24"]
}
variable "azs" {
    type = list
    default = ["ap-south-1a" , "ap-south-1b" ]
}
variable "sgports" {
   type = list
   default = [ 80,443]
}
variable "aws_ami_id" {
  default = "ami-00952f27cf14db9cd"
}
variable "remove_tcp_rule" {
  type    = bool
  description = "remove security group rule"
}
