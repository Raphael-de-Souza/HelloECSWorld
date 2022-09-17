resource "aws_db_instance" "database" {
  allocated_storage    = 5
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = "ecsdb"
  password             = "ecsdb1234"
  db_subnet_group_name = aws_db_subnet_group.databasegroup.name
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.dbsg.id]
  skip_final_snapshot    = true
  identifier             = var.db_instance_name
  multi_az               = var.multi_az_db

  tags = merge({
    Name = var.db_name
  }, var.default_tags)
}

output "dburl" {
  value = aws_db_instance.database.address
}