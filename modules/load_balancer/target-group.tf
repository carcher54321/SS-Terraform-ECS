resource "aws_lb_target_group" "traditional" {
  for_each = var.traditional_target_groups
  name = each.value.name
  port = each.value.port
  protocol = each.value.protocol
  vpc_id = each.value.vpc_id
  target_type = each.value.type
  health_check = each.value.health_check
}

resource "aws_lb_target_group" "lambda" {
  for_each = var.lambda_target_groups
  name = each.value.name
  target_type = "lambda"
}