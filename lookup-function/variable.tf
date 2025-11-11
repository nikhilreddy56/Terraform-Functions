#Creating location variable 
variable "location"{

    default="ap-south-1"   
    }
    
#Creating Instance variable    
variable "instance_type" {
    default= {
        us-east-1 = "t2.nano"
        ap-south-1 ="t2.nano"
    }
}
