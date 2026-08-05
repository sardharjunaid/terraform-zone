region = "ap-south-1"

vpc_info = {
  cidr = "10.0.0.0/16"
  tags = {
    Name = "terraform-vpc1"
    Env  = "dev"
  }
}

public_subnets = [{
  az   = "ap-south-1a"
  cidr = "10.0.0.0/24"
  tags = {
    Name = "web"
    Env  = "dev"
  }
}]

private_subnets = [{
  az   = "ap-south-1a"
  cidr = "10.0.1.0/24"
  tags = {
    Name = "app"
    Env  = "dev"
  }
  },
  {
    az   = "ap-south-1a"
    cidr = "10.0.2.0/24"
    tags = {
      Name = "db"
      Env  = "dev"
    }
}]


# web_subnet_info = {
#   cidr = "10.10.0.0/24"
#   az   = "ap-south-1a"
#   tags = {
#     Name = "web1"
#     Env  = "dev"
#   }
# }

# app_subnet_info = {
#   cidr = "10.10.1.0/24"
#   az   = "ap-south-1a"
#   tags = {
#     Name = "app1"
#     Env  = "dev"
#   }
# }

# db_subnet_info = {
#   cidr = "10.10.2.0/24"
#   az   = "ap-south-1a"
#   tags = {
#     Name = "db1"
#     Env  = "dev"
#   }
# }