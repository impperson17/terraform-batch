provider "aws" {
  region = var.region
}

resource "aws_vpc" "kaizen" {
  cidr_block       = var.vpc[0].vpc_cidr
  enable_dns_support = var.vpc[0].vpc_support
  enable_dns_hostnames = var.vpc[0].dns_host

  tags = {
    Name = var.vpc[0].vpc_name
  }
}

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = var.subnets[0].cidr_block
   map_public_ip_on_launch = true
  availability_zone = var.subnets[0].availability_zone

  tags = {
    Name = var.subnets[0].name
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = var.subnets[1].cidr_block
   map_public_ip_on_launch = true
  availability_zone = var.subnets[1].availability_zone

  tags = {
    Name = var.subnets[1].name
  }
}


resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = var.subnets[2].cidr_block
   map_public_ip_on_launch = false
  availability_zone = var.subnets[2].availability_zone

  tags = {
    Name = var.subnets[2].name
  }
}


resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = var.subnets[3].cidr_block
    map_public_ip_on_launch = false
  availability_zone = var.subnets[3].availability_zone

  tags = {
    Name = var.subnets[3].name
  }
}


resource "aws_internet_gateway" "homework5_igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = var.internet_gateway_name
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "${var.route_table_names[0]}"
  }
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "${var.route_table_names[1]}"
  }
}


resource "aws_route" "public_subnet_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.homework5_igw.id

  depends_on = [aws_internet_gateway.homework5_igw]
}


resource "aws_route_table_association" "public1_association" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "public2_association" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "private1_association" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_rt.id
}


resource "aws_route_table_association" "private2_association" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_rt.id
}