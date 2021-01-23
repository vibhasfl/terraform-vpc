provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = var.shared_credentials_path
  profile                 = var.aws_profile
}

resource "aws_vpc" "vpc" {
  cidr_block       = var.aws_vpc_cidr
  instance_tenancy = "default"
  tags = {
    "Name" = "${var.projectname}-vpc"
  }
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.aws_vpc_public_subnet_1a
  tags = {
    "Name" = "${var.projectname}-public-1a"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.aws_vpc_public_subnet_1b
  tags = {
    "Name" = "${var.projectname}-public-1b"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.aws_vpc_private_subnet_1a
  tags = {
    "Name" = "${var.projectname}-private-1a"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.aws_vpc_private_subnet_1b
  tags = {
    "Name" = "${var.projectname}-private-1b"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.projectname}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.projectname}-publicRouteTable"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.projectname}-privateRouteTable"
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "private_1a" {
  subnet_id = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_1b" {
  subnet_id = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route" "public-rt" {
  route_table_id = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route" "private-rt" {
  route_table_id = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.natgw_1.id
}


# If you want HA nat-gw you may need to create RT for both private subnets

resource "aws_nat_gateway" "natgw_1" {
  depends_on = [aws_internet_gateway.igw]
  subnet_id  = aws_subnet.public_subnet_1a.id
  allocation_id = aws_eip.natgw_eip_1.id

  tags = {
    "Name" = "${var.projectname}-natgw-1"
  }

}

resource "aws_eip" "natgw_eip_1" {
  depends_on = [aws_internet_gateway.igw]
  vpc = true
  tags = {
    "Name" = "${var.projectname}-natgw-eip-1"
  }
}

