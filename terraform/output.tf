output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_ids" {
  value = [aws_subnet.my_subnet1.id, aws_subnet.my_subnet2.id]
}

output "alb_dns_name" {
  value = aws_alb.my_alb.dns_name
}
