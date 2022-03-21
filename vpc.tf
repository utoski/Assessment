# Internet VPC
resource "aws_vpc" "interview-vpc" {
  cidr_block           = var.cirdr-blocks[0]
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "interview-vpc"
  }
}

# Pub-Subnet 1
resource "aws_subnet" "subnet-public-1" {
  vpc_id                  = aws_vpc.interview-vpc.id
  cidr_block              = var.cirdr-blocks[1]
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-2a"

  tags = {
    Name = "subnet-public-1"
  }
}


# Pub-Subnet 2
resource "aws_subnet" "subnet-public-2" {
  vpc_id                  = aws_vpc.interview-vpc.id
  cidr_block              = var.cirdr-blocks[2]
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-2b"

  tags = {
    Name = "subnet-public-2"
  }
}


# Priv-Subnet_1
resource "aws_subnet" "subnet-private-1" {
  vpc_id                  = aws_vpc.interview-vpc.id
  cidr_block              = var.cirdr-blocks[3]
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-2c"

  tags = {
    Name = "subnet-private-1"
  }
}

resource "aws_subnet" "subnet-private-2" {
  vpc_id                  = aws_vpc.interview-vpc.id
  cidr_block              = var.cirdr-blocks[4]
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-2c"

  tags = {
    Name = "main-private-2"
  }
}


# Public Route Table

resource "aws_route_table" "Public-routetable" {
  vpc_id = aws_vpc.interview-vpc.id
  tags = {
    Name = "Public-routetable"
  }
}


# Private Route Table
resource "aws_route_table" "Private-routetable" {
  vpc_id = aws_vpc.interview-vpc.id
  tags = {
    Name = "Private-routetable"
  }
}


# Public route-table associations
resource "aws_route_table_association" "RT-Association-public-1" {
  subnet_id      = aws_subnet.subnet-public-1.id
  route_table_id = aws_route_table.Public-routetable.id
}

resource "aws_route_table_association" "RT-Association-public-2" {
  subnet_id      = aws_subnet.subnet-public-2.id
  route_table_id = aws_route_table.Private-routetable.id
}

# Private route-table associations
resource "aws_route_table_association" "RT-Association-private-1" {
  subnet_id      = aws_subnet.subnet-private-1.id
  route_table_id = aws_route_table.Private-routetable.id
}

# Private route-table associations 

resource "aws_route_table_association" "RT-Association-private-2" {
  subnet_id      = aws_subnet.subnet-private-2.id
  route_table_id = aws_route_table.Private-routetable.id
}


# The_Internet Gateway 
resource "aws_internet_gateway" "interview-gw" {
  vpc_id = aws_vpc.interview-vpc.id
  tags = {
    Name = "interview-gw"
  }
}

# Conection of Pub Route and Internet 


resource "aws_route" "PublicRT-igw" {
  route_table_id            = aws_route_table.Public-routetable.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.interview-gw.id   
              
} 






