data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] 
}

resource "tls_private_key" "pipeline" { 
  algorithm = "ED25519"
}

resource "aws_key_pair" "pipeline" {
  key_name = "pipeline-server"
  public_key = tls_private_key.pipeline.public_key_openssh
}

resource "aws_security_group" "pipeline" {
  name = "pipeline-security-group"

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = "22"
    to_port = "22"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = "8080"
    to_port = "8080"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_eip" "pipeline" {
  instance = aws_instance.pipeline.id 
}

resource "aws_instance" "pipeline" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t4g.small"
  associate_public_ip_address = true
  key_name = aws_key_pair.pipeline.key_name
  vpc_security_group_ids = [aws_security_group.pipeline.id]

  tags = {
    Name = "pipeline"
  }
}
