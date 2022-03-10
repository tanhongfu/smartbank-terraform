#RDS instance
resource "aws_db_instance" "saturn_db" {
  allocated_storage    = 20
  #db_name = "smartbankdb"
  engine               = "postgres"
  identifier           =  "smartbank-db"     
  engine_version       = "13"
  # engine_version       = "14.1" should have used this
  instance_class       = "db.t3.micro"
  #name                 = "${local.Name}-rds-postgres" is deprecated? 
  db_name                 = "saturnpg"
  username             = var.db_username
  password             = var.db_password
  port                 = "5432"
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.sg.id]
  #availability_zone = aws_subnet.private.id
  db_subnet_group_name = aws_db_subnet_group.saturn_db_subnet_group.id
  multi_az = true
  
  }

  resource "aws_db_subnet_group" "saturn_db_subnet_group" {
  name       = "saturn-subnet-group"
  subnet_ids = [aws_subnet.private.id, aws_subnet.private2.id]

  tags = {
    Name = "${local.Name}-db-subnet-group"
  }
}


# attach security group to RDS instance 
/*see the endpoint in the console maybe can output this in terraform 
connect to this from pgadmin 
server - click and generate new server
name - AWS
connection - under hostname/address paste the endpoint 
check DB security group has port 5432 open or not select type as posgressql 
*/