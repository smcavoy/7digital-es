
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
	ami = "ami-0d77397e"
	instance_type ="t2.small"
  key_name = "default-key"
  security_groups = ["allow_all_ssh", "allow_all_outbound"]
  tags {
    Name = "node1"
    Type = "master"
  }
}

resource "aws_instance" "node2" {
	ami = "ami-0d77397e"
	instance_type ="t2.small"
  key_name = "default-key"
  security_groups = ["allow_all_ssh", "allow_all_outbound"]
  tags {
    Name = "node2",
    Type = "datanode"
  }
}

resource "aws_instance" "node3" {
	ami = "ami-0d77397e"
	instance_type ="t2.small"
  key_name = "default-key"
  security_groups = ["allow_all_ssh", "allow_all_outbound"]
  tags {
    Name = "node3",
    Type = "datanode"
  }
}

resource "aws_key_pair" "deployer" {
  key_name = "default-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkRL22OuciHQsNtnYNJCWAI0YMTBBkt7VHVGU7vlN2Py4GPCA0wIsBbRU8Q95yyylOgL3v80/E0C3vJJ7XQr9whs1HbPAcd64knq4qWxaysy6775cYSlH+5NBKyEyJuYqv/B9ezbtd5Dg/eU+S74Rd1uBiM8HxDmBgeIN5uPpifZanuLQDAwgnjPAC2tzwAbLD/1vqyojucxSbtyt9AghXS9UVikXQxE3Br7mERTO0NjeLeGXWYxpK+dfwD3D6BYz4bdRzdEn6FcoFJv4yjxL9AN5MnrNVg1ecTIBGX0JkhZ8z74B8rJGVqq9E55zPmDx+Iu2GMWN6HWZPdaSSR2+t"
}
