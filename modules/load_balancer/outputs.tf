#----------------------------------Target Group Outputs-------------------

output "traditional_tg_id" {
  value = aws_lb_target_group.traditional.*.id
  description = "All traditional target group IDs"
}

output "traditional_tg_arn" {
  value = aws_lb_target_group.traditional.*.arn
  description = "All traditional target group ARNs"
}

output "lambda_tg_id" {
  value = aws_lb_target_group.lambda.*.id
  description = "All lambda target group IDs"
}

output "lambda_tg_arn" {
  value = aws_lb_target_group.lambda.*.arn
  description = "All lambda target group ARNs"
}

#--------------------------------Load Balancer Outputs------------------------

output "load_balancer_id" {
  value = aws_lb.this.id
  description = "The ID of the load balancer"
}

output "load_balancer_arn" {
  value = aws_lb.this.arn
  description = "The ARN of the load balancer"
}

output "load_balancer_type" {
  value = aws_lb.this.load_balancer_type
  description = "The type of load balancer"
}
