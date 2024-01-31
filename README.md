# terraform-code
This repository contains Terraform code to deploy an AWS infrastructure consisting of a Virtual Private Cloud (VPC), public subnets, an Internet Gateway, a security group, and EC2 instances. The infrastructure is defined using HashiCorp Terraform, and it aims to provide a scalable and secure environment for hosting applications.

Terraform Files
main.tf
This file defines the main AWS resources, including EC2 instances, security groups, VPC, subnets, route tables, and an Internet Gateway. Key features include:

EC2 Instance: Launches an EC2 instance in each specified subnet with a dynamic count based on the length of var.subnets_cidr. Instances are tagged with a unique name and associated with a security group.

Security Group: Creates a security group (mysecuritygroup) with ingress rules specified in var.sgports and egress rule allowing all traffic. This security group is associated with the EC2 instances.

VPC: Defines a Virtual Private Cloud with a specified CIDR block (var.vpc_cidr) and tags it with a name.

Internet Gateway: Creates an Internet Gateway and associates it with the VPC.

Subnets: Defines public subnets with specified CIDR blocks and availability zones. Enables automatic assignment of public IPs (map_public_ip_on_launch).

Route Table: Sets up a route table (mypublicRT) with a default route to the Internet Gateway.

variables.tf
This file declares the input variables used in the main Terraform script. Key variables include:

var.aws_ami_id: The AMI (Amazon Machine Image) ID for the EC2 instances.
var.subnets_cidr: List of CIDR blocks for subnets.
var.sgports: Map of ingress ports for the security group.
var.vpc_cidr: CIDR block for the VPC.
var.azs: List of availability zones for subnets.
outputs.tf
This file declares the outputs that will be displayed after the Terraform apply. Currently, it outputs the public IP addresses of the EC2 instances.

How to Use
Install Terraform: Make sure Terraform is installed on your machine.

AWS Credentials: Ensure your AWS credentials are configured either by setting environment variables or using the AWS CLI.

Clone Repository: Clone this repository to your local machine.

Initialize Terraform: Run terraform init in the directory containing the Terraform files.

Adjust Variables: Modify the values in variables.tf if needed.

Deploy Infrastructure: Run terraform apply and confirm to deploy the AWS infrastructure.

Destroy Infrastructure (Optional): If needed, run terraform destroy to tear down the deployed infrastructure.

Notes
Ensure that your AWS IAM user has the necessary permissions to create and manage the specified resources.

Review and customize security group rules and other settings based on your specific requirements.

The default instance type is t2.micro. Adjust the instance_type variable in main.tf for different instance types.

Be cautious with exposing sensitive information such as AWS credentials and private keys.

For more details on Terraform commands and options, refer to the Terraform Documentation.
