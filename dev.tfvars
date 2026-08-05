region = "ap-south-1"

vpc_info = {
  cidr = "10.100.0.0/16"
  tags = {
    Name = "aws-ntier"
    Env  = "dev"
  }
}

public_subnets = [{
  az   = "ap-south-1a"
  cidr = "10.100.0.0/24"
  tags = {
    Name = "web-1"
    Env  = "dev"
  }
  },
  {
    az   = "ap-south-1b"
    cidr = "10.100.3.0/24"
    tags = {
      Name = "web-2"
      Env  = "dev"
    }
}]

private_subnets = [{
  az   = "ap-south-1a"
  cidr = "10.100.1.0/24"
  tags = {
    Name = "app-1"
    Env  = "dev"
  }
  },
  {
    az   = "ap-south-1a"
    cidr = "10.100.2.0/24"
    tags = {
      Name = "db-1"
      Env  = "dev"
    }
  },
  {
    az   = "ap-south-1b"
    cidr = "10.100.4.0/24"
    tags = {
      Name = "app-2"
      Env  = "dev"
    }
  },
  {
    az   = "ap-south-1b"
    cidr = "10.100.5.0/24"
    tags = {
      Name = "db-2"
      Env  = "dev"
    }
  },
  {
    az   = "ap-south-1a"
    cidr = "10.100.6.0/24"
    tags = {
      Name = "admin-1"
      Env  = "dev"
    }
  },
  {
    az   = "ap-south-1b"
    cidr = "10.100.7.0/24"
    tags = {
      Name = "admin-2"
      Env  = "dev"
    }
  }
]


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