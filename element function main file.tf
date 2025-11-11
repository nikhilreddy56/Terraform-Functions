#ADDING TERRAFORM PROVIDERS
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
#MANUALLY CREATING INSTANCE-1
resource "aws_instance" "instance" {
    count = length(var.instance_type)
    ami                     = element(var.ami,count.index)
    instance_type           = element(var.instance_type,count.index)
     
    #subnet_id               = aws_subnet.subnet1.id
    tags = {
    Name = "Instance-${count.index + 0}"
    }
}
