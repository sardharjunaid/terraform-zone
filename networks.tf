resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "from-tf"
    Env  = "dev"
  }
}

resource "aws_subnet" "web" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.web_subnet_cidr
  availability_zone = var.web_subnet_az
  tags = {
    Name = "web"
    Env  = "dev"
  }
  depends_on = [aws_vpc.main]

}

resource "aws_subnet" "app" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.app_subnet_cidr
  availability_zone = var.app_subnet_az
  tags = {
    Name = "app"
    Env  = "dev"
  }
  depends_on = [aws_vpc.main]
}

resource "aws_subnet" "db" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_cidr
  availability_zone = var.db_subnet_az
  tags = {
    Name = "db"
    Env  = "dev"
  }
  depends_on = [aws_vpc.main]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "from-tf"
    Env  = "dev"
  }
  depends_on = [aws_vpc.main]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private"
    Env  = "dev"
  }
  depends_on = [aws_subnet.app, aws_subnet.db]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public"
    Env  = "dev"
  }
  depends_on = [aws_subnet.web, aws_internet_gateway.igw]
}

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_internet_gateway.igw, aws_route_table.public]
  destination_cidr_block = "0.0.0.0/0"

}

resource "aws_route_table_association" "public-web" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.web.id
}

resource "aws_route_table_association" "private-app" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.app.id
}

resource "aws_route_table_association" "private-db" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.db.id

}