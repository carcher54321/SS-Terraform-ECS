#----------------------------------------------VPC Variables--------------------------

variable "vpc" {
  type = object({
    cidr_block = string
    name = string
  })
  description = "Name and CIDR block for the VPC"
}

variable "igw" {
  type = object({
    route_cidr_block = string
    name = string
  })
  description = "Name and CIDR for route to IGW"
}

variable "route_tables" {
  type = object({
    private_rt_name = string
    public_rt_name = string
  })
  description = "Names for route tables"
}

variable "security_groups" {
  type = map(object({
    name = string,
    description = string
    ingress_rules = map(object({
      from_port = number,
      to_port = number,
      protocol = string,
      cidr_blocks = list(string),
      description = string
    }))
    egress_rules = map(object({
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
      description = string
    }))
  }))
  description = "Variables for security groups"
}

variable "public_subnets" {
  type = map(object({
    cidr_block = string
    map_public_ip = bool
    availability_zone = string
    name = string
  }))
  description = "Public subnets for VPC"
}

variable "private_subnets" {
  type = map(object({
    cidr_block = string
    name = string
  }))
  description = "Private subnets for VPC"
}

#-----------------------------------------ECS Variables----------------------------------
# ECS Variables

variable "cluster_name" {
  type = string
  description = "The name of the ECS Cluster"
}

variable "cluster_tags" {
  type = map(string)
  description = "A map of strings to add to the cluster tags"
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

variable "include_ssm" {
  description = "Whether to include policies needed for AmazonSSM"
  type = bool
  default = false
}

#---------------------------------------------