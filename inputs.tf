variable "region" {
  type        = string
  description = "resources region"
  default     = "ap-south-1"
}

variable "vpc_info" {
  type = object({
    cidr = string
    tags = map(string)
  })
  default = {
    cidr = "192.168.0.0/16"
    tags = {
      Name = "from-tf"
      Env  = "dev"
    }
  }
  description = "vpc info"
}


variable "web_subnet_info" {
  type = object({
    cidr = string
    az   = string
    tags = map(string)
  })
  default = {
    cidr = "192.168.0.0/16"
    az   = "ap-south-1a"
    tags = {
      Name = "web"
      Env  = "dev"
    }
  }
  description = "web subnet info"
}



variable "app_subnet_info" {
  type = object({
    cidr = string
    az   = string
    tags = map(string)
  })
  default = {
    az   = "ap-south-1a"
    cidr = "192.168.1.0/24"
    tags = {
      Name = "app"
      Env  = "dev"
    }
  }
  description = "app subnet info"
}






variable "db_subnet_info" {
  type = object({
    cidr = string
    az   = string
    tags = map(string)
  })
  default = {
    az   = "ap-south-1a"
    cidr = "192.168.2.0/24"
    tags = {
      Name = "db"
      Env  = "dev"
    }
  }
  description = "db subne info"
}

