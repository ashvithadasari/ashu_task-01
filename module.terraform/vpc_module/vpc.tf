resource "aws_vpc" "vpc1" {
    cidr_block = var.vpcip
    tags = {
        Name = var.vpcname
    }
  
}

