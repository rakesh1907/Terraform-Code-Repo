provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "Terraform-Server"{
    ami = "ami-02d26659fd82cf299"
    instance_type = "t3.micro"
    
    # Lifecycle block ensures instance state is managed
    # When instance is stopped, terraform apply will automatically start it
    lifecycle {
        ignore_changes = []
    }
    
    tags = {
      Name = "Terraform-Server"
    }
}

resource "aws_security_group" "SG_Terraform" {
  name        = "SG_Terraform"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0fbf112c2ed57676a"

  tags = {
    Name = "allow_tls"
  }
}


# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }



