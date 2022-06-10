output "webserver-securitygroup-alb_id" {
    value = aws_security_group.alb.id
}

output "securitygroup_asg_id" {
    value = aws_security_group.my-asg-sg.id
}

output "launchconfiguration_arn" {
    description = "arn of launch config"
    value = aws_launch_configuration.my-test-launch-config.arn
}

output "launchconfiguration_id" {
    description = "id of launch config"
    value = aws_launch_configuration.my-test-launch-config.id
}

output "autoscaling_group_id" {
  description = "The AutoScaling Group id"
  value       = aws_autoscaling_group.example.id
}

output "autoscaling_group_name" {
  description = "The AutoScaling Group name"
  value       = aws_autoscaling_group.example.name
}

output "autoscaling_group_arn" {
  description = "ARN of the AutoScaling Group"
  value       = aws_autoscaling_group.example.arn
}

output "lb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = aws_lb.demo.id
}

output "lb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = aws_lb.demo.arn
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.demo.dns_name
}


output "lb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = aws_lb.demo.zone_id
}

output "http_listener_arn" {
  description = "The ARN of the HTTP load balancer listeners created."
  value       = aws_lb_listener.http.arn
}

output "http_listener_id" {
  description = "The IDs of the HTTP load balancer listeners created."
  value       = aws_lb_listener.http.id
}


output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = aws_lb_target_group.tg-asg.arn
}
