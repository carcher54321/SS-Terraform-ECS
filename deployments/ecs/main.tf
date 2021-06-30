module "vpc" {
  source = "../../modules/vpc"
  vpc = var.vpc
  igw = var.igw
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  route_tables = var.route_tables
  security_groups = var.security_groups
}

module "ecs" {
  source = "../../modules/ecs"
  create_ecs = true
  name = var.cluster_name
  include_ssm = var.include_ssm
  tags = var.cluster_tags
  capacity_providers = var.capacity_providers
  default_capacity_provider_strategy = var.default_capacity_provider_strategy
  container_insights = var.container_insights
}

module "secrets" {
  source = "../../modules/secrets"
  secrets = {
    ecs_cluster_name: {
      name = "ecs-cluster-name"
      secret_string = module.ecs.ecs_cluster_name
    }
    private_subnet_id: {
      name = "private-subnet-arn"
      secret_string = module.vpc.private_subnets_id[0]
    },
    public_subnet_id: {
      name = "public-subnet-arn"
      secret_string = module.vpc.public_subnets_id[0]
    },
    ecs_task_execution_role: {
      name = "ecs-task-execution-role"
      secret_string = module.ecs.iam_role_id  # TODO not sure if this is correct
    },
    security_group: {
      name = "security-group-arn"
      secret_string = module.vpc  # TODO export security group arn
    }
  }
}