resource "aws_vpc" "saturn_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "${local.Name}-vpc"
    # "market" = local.market
    #"product" = local.product
    #"application" = local.application
    # "environment" = local.environment
  }
}