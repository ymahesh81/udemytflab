resource "aws_db_instance" "firstsqldb" {
  allocated_storage   = 5
  engine              = "postgres"
  engine_version       = "14"
  #family               = "postgres14"
  instance_class      = "db.t2.micro"
  name                = "mydb1"
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}