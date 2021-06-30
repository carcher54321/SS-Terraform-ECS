#-------------------------VPC Outputs---------------------------------

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets_id" {
  value = module.vpc.public_subnets_id
}

output "private_subnets_id" {
  value = module.vpc.private_subnets_id
}

#--------------------------ECS Outputs---------------------------------

output "iam_instance_profile_id" {
  value = module.ecs.iam_instance_profile_id
}

output "iam_instance_profile_arn" {
  value = module.ecs.iam_instance_profile_arn
}

output "iam_role_id" {
  value = module.ecs.iam_role_id
}

output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}

output "ecs_cluster_arn" {
  value = module.ecs.ecs_cluster_arn
}

output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
}