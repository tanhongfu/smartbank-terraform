resource "aws_nat_gateway" "saturn_ngw" {
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    "Name" = "${local.Name}-ngw"
    #"market" = local.market
    #"product" = local.product
    #"application" = local.application
    # "environment" = local.environment
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  #depends_on = [aws_internet_gateway.igw]
}