#------------------------------------IAM Outputs--------------------------

output "iam_instance_profile_id" {
  description = "ID of the IAM instance profile"
  value = aws_iam_instance_profile.this.id
}

output "iam_instance_profile_arn" {
  description = "ARN of the IAM instance profile"
  value = aws_iam_instance_profile.this.arn
}

output "iam_role_id" {
  description = "ID of the IAM role"
  value = aws_iam_role.this.id
}

#----------------------------------ECS Outputs---------------------------

output "ecs_cluster_id" {
  description = "ID of the ECS Cluster"
  value = concat(aws_ecs_cluster.this.*.id, [""])[0]
}

output "ecs_cluster_arn" {
  description = "ARN of the ECS Cluster"
  value = concat(aws_ecs_cluster.this.*.arn, [""])[0]
}

output "ecs_cluster_name" {
  description = "The name of the ECS Cluster"
  value = var.name
}