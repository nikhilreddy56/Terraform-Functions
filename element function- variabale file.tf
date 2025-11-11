#CREATING instance VARIABLE 
variable "instance_type" {
    default = ["t2.micro", "t2.nano"]
  
}
#CREATING ami VARIABLE
variable "ami" {
    default = ["ami-01bc990364452ab3e","ami-0fc5d935ebf8bc3bc"]
  
}
