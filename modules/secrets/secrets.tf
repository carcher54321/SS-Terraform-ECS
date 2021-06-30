resource "aws_secretsmanager_secret" "this" {
  for_each = var.secrets
  name = each.value.name
}

resource "aws_secretsmanager_secret_version" "this" {
  for_each = var.secrets
  secret_id = each.value.name  # TODO this might work or i might have to figure out getting the id
  secret_string = each.value.secret_string
}