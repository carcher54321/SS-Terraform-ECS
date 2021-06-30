#-----------------------------------Load Balancer Variables----------------

variable "name" {
  description = "The name of the load balancer"
  type = string
}

variable "internal" {
  description = "Whether or not the load balancer will be internal"
  type = bool
  default = false
}

variable "load_balancer_type" {
  description = "The type of load balancer"
  type = string
  default = "application"
}

variable "security_groups" {
  description = "A list of security group IDs to associate with this load balancer"
  type = list(string)
  default = []
}

variable "subnets" {
  description = "A list of subnet IDs to associate with this load balancer"
  type = list(string)
  default = []
}

variable "listeners" {
  description = "A map of listeners to create"
  type = map(object({
    port = string
    protocol = string
    default_action = object({
      type = string
      target_group_name = string
    })
  }))
}

#------------------------------------Target Group Variables----------------

variable "traditional_target_groups" {
  description = "All the traditional target groups to be created"
  type = map(object({
    type = string
    name = string
    port = number
    protocol = string
    vpc_id = string
    health_check = object({
      enabled = bool
      healty_threshold = number
      interval = number
      matcher = string
      path = string
      port = any
      protocol = string
      timeout = number
      unhealthy_threshold = number
    })
  }))
  default = {}
}

variable "lambda_target_groups" {
  description = "All the lambda target groups to be created"
  type = map(object({
    name = string
  }))
  default = {}
}