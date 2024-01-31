# Terraform AWS Infrastructure Deployment

## Prerequisites
1. [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
2. AWS credentials configured with the necessary permissions.
3. pem key.

## Usage

1. Clone the repository to your local machine.
    ```bash
    git clone https://github.com/yourusername/your-repo.git
    cd your-repo
    ```

2. Update the `variables.tf` file with your desired values.
    - Set the `aws_region` variable to your preferred AWS region.
    - Adjust the `vpc_cidr` variable to the desired CIDR block for the VPC.
    - Customize `subnets_cidr` with the CIDR blocks for your subnets.
    - Modify `azs` to match your preferred availability zones.
    - Adjust `sgports` to specify the allowed ports for the security group.
    - Set `aws_ami_id` to the desired Amazon Machine Image (AMI) ID for your EC2 instances.
    - Optionally, set `remove_tcp_rule` to `true` if you want to remove a specific TCP rule from the security group.

3. Initialize the Terraform configuration.
    ```bash
    terraform init
    ```

4. Review the execution plan.
    ```bash
    terraform plan
    ```

5. Apply the Terraform configuration to create the AWS infrastructure.
    ```bash
    terraform apply
    ```

6. After the deployment is complete, you will see the outputs, including the public IP addresses of the EC2 instances.

## Clean Up

To destroy the deployed infrastructure and clean up resources:
```bash
terraform destroy
