provider "aws" {
    region = "eu-west-1"
}

resource "aws_security_group" "allow_all_ssh" {
  name = "allow_all_ssh"
  description = "Allow all inbound ssh"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_all_from_home" {
  name = "allow_all_from_home"
  description = "Allow all from my home IP"
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks =  ["82.171.247.75/32"]
  }
}

resource "aws_security_group" "allow_all_outbound" {
  name = "allow_all_outbound"
  description = "Allow everything out"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "node1" {
	ami = "ami-399f3c4a"
	instance_type ="t2.small"
  key_name = "default-key"
  security_groups = ["allow_all_ssh", "allow_all_outbound", "allow_all_from_home"]
  tags {
    Name = "node1"
    Type = "master"
  }
}

resource "aws_instance" "node2" {
	ami = "ami-399f3c4a"
	instance_type ="t2.small"
  key_name = "default-key"
  security_groups = ["allow_all_ssh", "allow_all_outbound", "allow_all_from_home"]
  tags {
    Name = "node2",
    Type = "datanode"
  }
}

resource "aws_instance" "node3" {
	ami = "ami-399f3c4a"
	instance_type ="t2.small"
  key_name = "default-key"
  security_groups = ["allow_all_ssh", "allow_all_outbound", "allow_all_from_home"]
  tags {
    Name = "node3",
    Type = "datanode"
  }
}

resource "aws_key_pair" "deployer" {
  key_name = "default-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7rMwIRTZyl0ke/tPQS5vuOfxPNWe0rJszXyv4vMhNshPQ1UPC118kAcqaMqzyWacJhz8c5Qna2AaYxlUr5xpqsvxEk6YJ8Ey+3xjybFvNDvXQvXR/TytUYF8ZBvF499L06kWFDtzY37CMyBVlCj3IVH0ZCVLzkXuD/Crlc1nD8kE1KZeeFrjdg2LZDZdt11O9uf9p0XHqU9LC+jD9hTDlUBnfrYxnEcQE5llli1S3SkkMA1lIrqRQkWYfI73sWmqPjHFRkEFbCNCfPaYFUiGsdApiuLEufMuqHuMqWfMwF6FcMRgjsZmvxrg/Cl9mRZaoQfdsJtEzT07bu7iYzHed smcavoy@apollo"
}
