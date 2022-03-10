resource "aws_security_group" "sg" {
  name        = "${local.Name}-sg"
  description = "Allow SSH/HTTP/Postgres traffic on port 22 80 3000 and 5432"
  vpc_id      = aws_vpc.saturn_vpc.id

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  /*ingress {
    description = "HTTP Access for SB-API"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "Postgres Access"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
   description      = "HTTP Access for React-app"
  from_port        = 3000
   to_port          = 3000
  protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]

  }

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  } */

  #tags = {
  #"market" = local.market
  #"product" = local.product
  #"application" = local.application
  #"environment" = local.environment
}