# iac-k8s-cluster
iac-k8s-cluster

## AWS Initial configurations

- Have a AWS account.
- Subnet, Internet Gateway parametrization and others.
- Create a security Group
- Create a Role having the policy <<trin>>

 Note: Public Ip Configuration

## Access Keys generation

- Obtain key pair

- Download *.pem file



## Terraform IaC

- server.tf construction

provider "aws" {
    region = "eu-west-3"
    access_key = "aws_user_access_key"
    secret_key = "aws_user_secret_key"
}

resource "aws_security_group" "jenkins_sg" {
    ami = "ami-0357d42faf6fa582f"
    instance_type = "t2.micro"
}
    name        = "jenkins_sg"
    description = "SG for SSH Access"
    vpc_id      = "vpc-0084753900c01263c"
    ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["public ip/32"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }



resource "aws_instance" "example" {
    ami = "ami-0357d42faf6fa582f"
    instance_type = "t2.micro"
}


- Infrastructure creation


terraform init

terraform plan

terraform apply

terraform destroy
 
## instance check

ssh -i "obsec.pem" ubuntu@10.10.0.21

## Jenkins Installation