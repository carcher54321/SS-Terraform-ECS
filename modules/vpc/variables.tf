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