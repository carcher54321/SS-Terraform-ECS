#--------------------------------------VPC Variables------------------------------------

vpc = {
  cidr_block = "10.0.0.0/16"
  name = "utopia-vpc"
}

igw = {
  route_cidr_block = "0.0.0.0/0"
  name = "utopia-igw"
}

route_tables = {
  private_rt_name = "utopia-private-rt"
  public_rt_name = "utopia-public-rt"
}

security_groups = {
  web_sg: {
    name = "web_sg_public"
    description = "Security group for allowing external web traffic"
    ingress_rules = {
      http: {
        from_port = 80
        to_port = 80
        description = "Allow http"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      https: {
        from_port = 443
        to_port = 443
        description = "Allow https"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    egress_rules = {
      base: {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all traffic"
      }
    }
  }
}

public_subnets = {
  1: {
    cidr_block = "10.0.0.0/24"
    map_public_ip = true
    availability_zone = ""  # TODO find availability zone str
    name = "utopia_public_subnet"
  }
}

private_subnets = {
  1: {
    cidr_block = "10.0.1.0/24"
    name = "utopia-private-subnet"
  }
}

#----------------------------------------ECS Variables--------------------

cluster_name = "Utopia"

cluster_tags = {
  Name: "Utopia"
}

capacity_providers = ["FARGATE", "FARGATE_SPOT"]

default_capacity_provider_strategy = [{
  capacity_provider = "FARGATE_SPOT"
  weight = "1" },
  {
  capacity_provider = "FARGATE"
  weight = "0.5" }
]

container_insights = false

include_ssm = false
