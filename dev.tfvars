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

web_security_group_info = {
  tags = {
    Name = "web"
    Env  = "dev"
  }
  ingress_rules = [{
    tags = {
      Name = "web-ingress-http"
      Env  = "dev"
    }
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 80
    ip_protocol = "tcp"
    to_port     = 80
    },
    {
      tags = {
        Name = "web-ingress-https"
        Env  = "dev"
      }
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 443
      ip_protocol = "tcp"
      to_port     = 443
    },
    {
      tags = {
        Name = "web-ingress-ssh"
        Env  = "dev"
      }
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 22
      ip_protocol = "tcp"
      to_port     = 22
  }]
  egress_rule = [{
    tags = {
      Name = "web-egress"
      Env  = "dev"
    }
    cidr_ipv4   = "0.0.0.0/0"
    ip_protocol = "-1"
  }]
}


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