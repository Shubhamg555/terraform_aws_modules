output "webserver-securitygroup-alb_id" {
    value = aws_security_group.alb.id
}

output "securitygroup_asg_id" {
    value = aws_security_group.my-asg-sg.id
}

output "alb_id" {
    value = aws_lb.demo.arn
}