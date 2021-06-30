variable "create_ecs" {
  description = "Controls if ECS should be created"
  type = bool
  default = true
}

variable "name" {
  description = "The name of the cluster"
  type = string
}

variable "include_ssm" {
  description = "Whether to include policies needed for AmazonSSM"
  type = bool
  default = false
}

variable "tags" {
  description = "A map of tags to add to the ECS cluster"
  type = map(string)
  default = {}
}

variable "capacity_providers" {
  description = "List of short names of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE_SPOT"
  type = list(string)
  default = []
}

variable "default_capacity_provider_strategy" {
  description = "The capacity provider strategy to use by default for the cluster. Can be one or more"
  type = list(map(any))
  default = []
}

variable "container_insights" {
  description = "Controls if ECS Cluster has container insights enabled"
  type = bool
  default = false
}