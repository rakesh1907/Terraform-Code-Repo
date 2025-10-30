provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "Terraform-Server"{
    ami = "ami-02d26659fd82cf299"
    instance_type = "t3.micro"
    key_name = "Terraform-Server"
}

