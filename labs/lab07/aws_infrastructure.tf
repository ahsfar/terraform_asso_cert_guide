// which cloud provider
provider "aws" {
  region = "us-east-1"
}

// creating ec2
resource "aws_instance" "demo-server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = "dop"
  //security_groups = [ "demo-sg" ]
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  subnet_id              = aws_subnet.dop-public-subnet-01.id
  // for each loop to create multiple ec2 instances
  for_each = toset(["jenkins-master", "build-slave", "ansible"])
  tags = {
    Name = "${each.key}"
  }

}

// creating security group for ec2
resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"
  vpc_id      = aws_vpc.dop-vpc.id
  // inbound traffic rules
  ingress {
    description = "Shh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  // outbound traffic rules 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-prot"

  }
}

// creating vpc
resource "aws_vpc" "dop-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "dop-vpc"
  }

}

// creating subnet 
resource "aws_subnet" "dop-public-subnet-01" {
  vpc_id                  = aws_vpc.dop-vpc.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "dop-public-subent-01"
  }
}

// creating subnet 
resource "aws_subnet" "dop-public-subnet-02" {
  vpc_id                  = aws_vpc.dop-vpc.id
  cidr_block              = "10.1.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"
  tags = {
    Name = "dop-public-subent-02"
  }
}

// creating internet gateway
resource "aws_internet_gateway" "dop-igw" {
  vpc_id = aws_vpc.dop-vpc.id
  tags = {
    Name = "dop-igw"
  }
}

// creating routing table
resource "aws_route_table" "dop-public-rt" {
  vpc_id = aws_vpc.dop-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dop-igw.id
  }
}

// associating route table with subnet group
resource "aws_route_table_association" "dop-rta-public-subnet-01" {
  subnet_id      = aws_subnet.dop-public-subnet-01.id
  route_table_id = aws_route_table.dop-public-rt.id
}

// associating route table with subnet group
resource "aws_route_table_association" "dop-rta-public-subnet-02" {
  subnet_id      = aws_subnet.dop-public-subnet-02.id
  route_table_id = aws_route_table.dop-public-rt.id
}
