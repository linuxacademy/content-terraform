#provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"

  #aws_profile = "${var.aws_profile}"
  region = "${var.aws_region}"
}

data "aws_availability_zones" "available" {}

# VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block = "${var.vpc_cidr}"
}

#internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
}

#Create multiple public subnet
resource "aws_subnet" "tf_public_subnet" {
  count                   = "${var.subnet_count}"
  vpc_id                  = "${aws_vpc.tf_vpc.id}"
  cidr_block              = "${var.public_subnet_cidrs[count.index]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "tf_public_subnet_${count.index + 1}"
  }
}

#create multiple private subnet
resource "aws_subnet" "tf_private_subnet" {
  count                   = "${var.subnet_count}"
  vpc_id                  = "${aws_vpc.tf_vpc.id}"
  cidr_block              = "${var.private_subnet_cidrs[count.index]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "tf_private_subnet_${count.index + 1}"
  }
}

# Route tables
resource "aws_route_table" "tf_public_rt" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags {
    Name = "rt_public"
  }
}

# Private route table
resource "aws_default_route_table" "tf_private_rt" {
  default_route_table_id = "${aws_vpc.tf_vpc.default_route_table_id}"

  tags {
    Name = "rt_private"
  }
}

# Subnet Associations for public route table
resource "aws_route_table_association" "tf_public_assoc" {
  count          = "${aws_subnet.tf_public_subnet.count}"
  subnet_id      = "${aws_subnet.tf_public_subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.tf_public_rt.id}"
}

# Subnet Associate for private route table
resource "aws_route_table_association" "tf_private_assoc" {
  count          = "${aws_subnet.tf_private_subnet.count}"
  subnet_id      = "${aws_subnet.tf_private_subnet.*.id[count.index]}"
  route_table_id = "${aws_default_route_table.tf_private_rt.id}"
}

#EIP
resource "aws_eip" "nat_eip" {
  vpc = true
}

#Nat gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.tf_public_subnet.*.id}"

  tags {
    Name = "nat gateway"
  }
}

#Private security group

resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "Used for access to private instances"
  vpc_id      = "${aws_vpc.tf_vpc.id}"

  #SSH

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }

  #HTTP

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Bastion host security group (public)
resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "Used for public instances"
  vpc_id      = "${aws_vpc.tf_vpc.id}"

  #SSH

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }

  #HTTP

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound internet access

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#ALB Security group
resource "aws_security_group" "alb_sg" {
  name        = "public_sg"
  description = "Used for public and private instances for load balancer access"
  vpc_id      = "${aws_vpc.tf_vpc.id}"

  #SSH

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }

  #HTTP

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound internet access

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
