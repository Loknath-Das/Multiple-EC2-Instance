# Collecting availability zone from particular region

data "aws_availability_zones" "az" {
    state = "available"
}

# Creating VPC

resource "aws_vpc" "vpc" {
    cidr_block              = var.vpc_cidr
    enable_dns_support      = "true"
    enable_dns_hostnames    = "true"

    tags = {
       env  =   "prod"
       Name =   "${var.name}-vpc"
    }
  
}

# Internet Gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    env  = "prod"
    Name = "${var.name}-igw"
  }
}

# Public subnet 

resource "aws_subnet" "public" {
  count                     = var.subnet_count
  vpc_id                    = aws_vpc.vpc.id
  cidr_block                = element(var.subnets_cidr, count.index)
  availability_zone         = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch   = true

  tags = {
    env     = "prod"
    Name    = "${var.name}-subnet- ${count.index + 1}"
  }


}

# Route table

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    env  = "prod"
    Name = "${var.name}-rtable"
  }
}

# Route table association

resource "aws_route_table_association" "rta" {
  count             = length(var.subnets_cidr)
  subnet_id         = element(aws_subnet.public.*.id, count.index)
  route_table_id    = aws_route_table.route.id
}


# Security Group (SSH only from anywhere)

resource "aws_security_group" "sg" {
  name          = "${var.name}-sgrp"
  vpc_id        = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    env  = "prod"
    Name = "${var.name}-sgrp"
  }
}