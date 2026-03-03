resource "aws_default_route_table" "DRT" {
  default_route_table_id = var.default_rt_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw
  }


  tags = {
    Name = var.rtname
      }
}