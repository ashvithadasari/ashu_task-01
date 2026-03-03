resource "aws_subnet" "subnet" {
    vpc_id = var.vpcid
    cidr_block = var.subip
    availability_zone = var.avilzone

    tags = {
        Name = var.subname
    }
      
}