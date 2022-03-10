resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.saturn_vpc.id
  #depends_on = [aws_vpc.vpc]

  tags = {
    "Name" = "${local.Name}-igw"
    #"market" = local.market
    #"product" = local.product
    #"application" = local.application
    #"environment" = local.environment
  }
}