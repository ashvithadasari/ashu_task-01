output "vpcop" {
    value = aws_vpc.vpc1.id
  
}

output "drtop" {
    value = aws_vpc.vpc1.default_route_table_id
  
}
