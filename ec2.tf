# Security Group

resource "aws_security_group" "web_sg" {
  name        = "ecommerce-web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.ecommerce_vpc.id

  # SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Frontend HTTP
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Backend API
  ingress {
    description = "Backend API"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Jenkins
  ingress {
    description = "Jenkins"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecommerce-web-sg"
  }
}

# Frontend EC2

resource "aws_instance" "frontend_server" {
  ami                    = "ami-0acc77abdfc7ed5a6"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = "terraform-key"

  tags = {
    Name = "Frontend-Server"
  }
}

# Backend EC2

resource "aws_instance" "backend_server" {
  ami                    = "ami-0acc77abdfc7ed5a6"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = "terraform-key"

  tags = {
    Name = "Backend-Server"
  }
}

# Jenkins EC2

resource "aws_instance" "jenkins_server" {
  ami                    = "ami-0acc77abdfc7ed5a6"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = "terraform-key"

  tags = {
    Name = "Jenkins-Server"
  }
}
