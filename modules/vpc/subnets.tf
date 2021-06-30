resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnets
  vpc_id = aws_vpc.this.id
  cidr_block = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.value.name == "" ? "public-subnet" : each.value.name
  }
}

resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnets
  vpc_id = aws_vpc.this.id
  cidr_block = each.value.cidr_block
  tags = {
    Name = each.value.name == "" ? "private-subnet" : each.value.name
  }
}