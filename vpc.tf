resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    "Name" = "abdul-main"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "abdul-main"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
    tags = {
    Name = "abdul-main-public"
  }
}

resource "aws_route" "main" {
  route_table_id            = aws_route_table.main.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}




resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnets, count.index)
  tags = {
    Name = "abdul-public-subnet-${count.index+2}"
  }
}

resource "aws_route_table_association" "main" {
  count = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.main.id
}


