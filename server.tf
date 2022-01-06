provider "aws" {
    access_key = "AKIARJ72QXRZADQXINXA"
    secret_key = "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"
    region = "us-east-1"
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "SG for SSH Access"
  vpc_id      = "vpc-0084753900c01263c"
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["181.71.139.168/32"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "jenkins_sg"
  }
}

resource "aws_instance" "test_lab_obsec_kubernetes" {
  ami                    = "ami-0e472ba40eb589f49"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-03207e530099ee12c"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  key_name               = "obsec"
  iam_instance_profile = "rol-obsec-k8s-cluster"
  # arn:aws:iam::090182827122:role/rol-obsec-k8s-cluster
  root_block_device {
    volume_type = "gp2"
    volume_size = "20"
  }
  tags = {
    Name = "test_lab_obsec_kubernetes"
  }
}

