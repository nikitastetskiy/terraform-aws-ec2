provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_vpc" "ubuntu_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf_ubuntu_vpc"
  }
}

resource "aws_subnet" "ubuntu_subnet" {
  vpc_id            = aws_vpc.ubuntu_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "tf_ubuntu_subnet"
  }
}

resource "aws_network_interface" "ubuntu_network_interface" {
  subnet_id   = aws_subnet.ubuntu_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "tf_ubuntu_network_interface"
  }
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  
  network_interface {
    network_interface_id = aws_network_interface.ubuntu_network_interface.id
    device_index         = 0
  }

  tags = {
    Name = var.instance_name
  }
}
