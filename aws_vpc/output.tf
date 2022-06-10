output "vpc_id" {
    description = "ID of the created VPC"
    value = aws_vpc.dev.id
}

output "publicsubnet-1"  {
    description = "ID of the create public subnet 1"
    value = aws_subnet.dev-public-1.id
}

output "publicsubnet-2"  {
    description = "ID of the create public subnet 2"
    value = aws_subnet.dev-public-2.id
}

output "privatesubnet-1"  {
    description = "ID of the create private subnet 1"
    value = aws_subnet.dev-private-1.id
}

output "privatesubnet-2"  {
    description = "ID of the create private subnet 2"
    value = aws_subnet.dev-private-2.id
}

output "privatesubnet-3"  {
    description = "ID of the create private subnet 3"
    value = aws_subnet.dev-private-3.id
}

output "privatesubnet-4"  {
    description = "ID of the create private subnet 4"
    value = aws_subnet.dev-private-4.id
}

output "internetgateway_id" {
    description = "ID of the created Internet Gateway"
    value = aws_internet_gateway.dev-gw.id
}

output "natgateway_id" {
    description = "ID of the nat gateway"
    value = aws_nat_gateway.nat-gw.id
}

output "publicroutetable_id" {
    description = "ID of the public routetable"
    value = aws_route_table.dev-public.id
}

output "privateroutetable_id" {
    description = "ID of the private routetable"
    value = aws_route_table.dev-private.id
}