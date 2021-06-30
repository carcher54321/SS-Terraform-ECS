resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = var.igw.route_cidr_block
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = var.route_tables.public_rt_name
  }
}

resource "aws_route_table_association" "public_rt_association" {
  for_each = aws_subnet.public_subnets
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = each.value.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = var.route_tables.private_rt_name
  }
}

resource "aws_route_table_association" "private_rt_association" {
  for_each = aws_subnet.private_subnets
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = each.value.id
}