resource "aws_db_instance" "mysql" {
  identifier = "ecommerce-mysql"

  allocated_storage = 20
  storage_type      = "gp2"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  username = "admin"
  password = "Password123!"

  publicly_accessible = true

  skip_final_snapshot = true

  tags = {
    Name = "ecommerce-mysql"
  }
}
