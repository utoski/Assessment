# Variables

variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "AWS_ACESS_KEY" {
  }

  variable "AWS_SECRET_KEY" {
  }

variable "PATH_TO_PRIVATE_KEY" {
  default = "testi-keypair"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "testi-keypair.pub"
}




 #The VPC cidr and Subnet cider var
variable "cirdr-blocks" {
    type = list(string)
    default = ["10.0.0.0/16","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24"]
}


variable "AMI" {
  type = string
  default =  "ami-0e6148c4e17f21b0b"
    
}

variable "ebs-size" {
  type = string
  default =  "12"
    
}

variable "instance-size" {
  type = string
  default =  "t2.micro"
    
}

