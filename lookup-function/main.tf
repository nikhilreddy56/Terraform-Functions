#ADDING PROVIDERS
terraform {
    required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
    }
    }
}

#GIVING ACCESS KEY AND SECRET-ACCESS KEY
provider "aws" {
    # region = "us-east-1"
    access_key = "access-key"
    secret_key = "secret-key"
}

#Creating Instances based on location and instance type 
resource "aws_instance" "instance" {
    ami                     = "ami-01bc990364452ab3e"
    instance_type           = lookup(var.instance_type,var.location) 
    #subnet_id               = aws_subnet.subnet1.id
    tags = {
    Name = "Terraform-instance"
    }
}
