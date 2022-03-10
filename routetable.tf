resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.saturn_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "${local.Name}-public-rt"
    #"market" = local.market
    #"product" = local.product
    #"application" = local.application
    #"environment" = local.environment
  }
}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "public_rt_association2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.saturn_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.saturn_ngw.id
  }

  tags = {
    "Name" = "${local.Name}-private-rt"
    #"market" = local.market
    #"product" = local.product
    #"application" = local.application
    #"environment" = local.environment
  }
}

resource "aws_route_table_association" "private_rt_association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_rt.id
}