output "private_subnet_id" {
  description = "The ID of the subnet."
  value = aws_subnet.private.id
} 

/* output "api_listener_arn" {
  description = "The arn of the api_listener."
  value = aws_alb_listener.api_listener.arn
} 

output "api_tg_arn" {
  description = "The arn of the api_target group."
  value = aws_lb_target_group.api_tg.arn
} */ 