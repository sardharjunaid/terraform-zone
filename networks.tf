resource "aws_vpc" "main" {
  cidr_block           = var.vpc_info.cidr
  enable_dns_hostnames = true
  tags                 = var.vpc_info.tags
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnets[count.index].cidr
  availability_zone = var.public_subnets[count.index].az
  tags              = var.public_subnets[count.index].tags
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_vpc.main]

}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[count.index].cidr
  availability_zone = var.private_subnets[count.index].az
  tags              = var.private_subnets[count.index].tags
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_vpc.main]
}

# resource "aws_subnet" "db" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.db_subnet_info.cidr
#   availability_zone = var.db_subnet_info.az
#   tags = var.db_subnet_info.tags
#   depends_on = [aws_vpc.main]
# }

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "from-tf"
    Env  = "dev"
  }
  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_vpc.main]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private"
    Env  = "dev"
  }
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_subnet.private]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public"
    Env  = "dev"
  }
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_subnet.public, aws_internet_gateway.igw]
}

resource "aws_route" "internet" {
  route_table_id = aws_route_table.public.id
  gateway_id     = aws_internet_gateway.igw.id
  lifecycle {
    create_before_destroy = true
  }
  depends_on             = [aws_internet_gateway.igw, aws_route_table.public]
  destination_cidr_block = "0.0.0.0/0"

}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public[count.index].id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets)
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private[count.index].id
}

# resource "aws_route_table_association" "private-db" {
#   route_table_id = aws_route_table.private.id
#   subnet_id      = aws_subnet.db.id

# }