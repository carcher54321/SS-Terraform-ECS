resource "aws_lb" "this" {
  name = var.name
  internal = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups = var.security_groups
  subnets = var.subnets
}

resource "aws_lb_listener" "this" {
  for_each = var.listeners
  load_balancer_arn = aws_lb.this.arn
  port = each.value.port
  protocol = each.value.protocol
  default_action {
    type = "forward"
    target_group_arn = [for tg in merge(aws_lb_target_group.lambda, aws_lb_target_group.traditional).values(): tg.arn if tg.name == each.value.default_action.target_group_name][0]
  }
  depends_on = [aws_lb_target_group.lambda, aws_lb_target_group.traditional]
}