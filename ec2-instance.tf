
# Creating VPC for my EC2 instance

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

# Creating subnet for my EC2 instance

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-example"
  }
}

# Creating a Network Interface for my EC2 instance

resource "aws_network_interface" "devops" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

# Creating EC2 instance

resource "aws_instance" "devops" {
  ami           = "ami-0dc2d3e4c0f9ebd18" # Virginia us-east-1 Ami Amazon Linux 2 
  instance_type = "t3a.nano"

  network_interface {
    network_interface_id = aws_network_interface.devops.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

# Creating EBS Volume for attaching to my EC2 instance

resource "aws_ebs_volume" "devops" {
  availability_zone = "us-east-1a"
  size              = 20

  tags = {
    Name = "DevOps"
  }
}

# Creating Association between EBS Volume and my EC2 instance

resource "aws_volume_attachment" "devops" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.devops.id
  instance_id = aws_instance.devops.id
}

# Creating AWS Security Groups for my EC2 instance -- SSH Access

resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "ssh"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "SSH - VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["11.22.33.44"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# Creating Association between Security Group and my EC2 instance

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.ssh.id
  network_interface_id = aws_instance.devops.primary_network_interface_id
}