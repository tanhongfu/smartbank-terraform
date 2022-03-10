resource "aws_eip" "ngw_eip" {
  #depends_on = [aws_nat_gateway.saturn_ngw]

  tags = {
    Name = "${local.Name}-ngw-eip"
    #"market" = local.market
    #"product" = local.product
    #"application" = local.application
    #"environment" = local.environment
  }
}