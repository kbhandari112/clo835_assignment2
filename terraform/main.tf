provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "webapp" {
  name = "webapp"
}

resource "aws_ecr_repository" "mysql" {
  name = "mysql"
}

resource "aws_key_pair" "assignment_key" {
  key_name   = "assignment2-key"
  public_key = file("/home/ec2-user/environment/clo835_assignment2/terraform/assignment2-key.pub")
}


resource "aws_instance" "ec2" {
  ami           = "ami-0953476d60561c955" # Amazon Linux 2
  instance_type = "t3.large"
  key_name      = "assignment2-key" 
  subnet_id     = "subnet-08c8a4a4cb4a4c51e"         # Replace with default VPC public subnet ID
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  tags = { Name = "Assignment2-EC2" }
}

resource "aws_security_group" "ec2_sg" {
  name_prefix = "ec2-sg-"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8081
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}