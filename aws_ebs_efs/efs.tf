resource "tls_private_key" "my_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "deployer" {
  key_name   = "efs-key"
  public_key = tls_private_key.my_key.public_key_openssh
}

resource "aws_vpc" "vpc_main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

}

resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.vpc_main.id}"
  cidr_block              = "10.0.1.0/24" 
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
 
}


resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Allow SSH and HTTP"
  vpc_id  = "${aws_vpc.vpc_main.id}"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "EFS mount target"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
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

resource "aws_instance" "testEC2" {
  ami        = "ami-079b5e5b3971bd10d"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ec2_sg.id}"]
  key_name = aws_key_pair.deployer.key_name
  subnet_id     = "${aws_subnet.public.id}"
  lifecycle {
    create_before_destroy = true
  }
} 

resource "aws_efs_file_system" "efs" {
  creation_token = "my-efs"

  tags = {
    Name = "MyProduct"
  }
}

resource "aws_efs_mount_target" "mount" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_instance.testEC2.subnet_id
  security_groups = [aws_security_group.ec2_sg.id]

}

resource "null_resource" "configure_nfs" {
  depends_on = [aws_efs_mount_target.mount]
   connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = tls_private_key.my_key.private_key_pem
    host     = aws_instance.testEC2.public_ip
   }
}   