variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
  default     = "192.168.0.0/16"
}

variable "web_subnet_cidr" {
  type        = string
  description = "web subnet cidr"
  default     = "192.168.0.0/24"
}

variable "web_subnet_az" {
  type        = string
  description = "we subnet availability zones"
  default     = "ap-south-1a"
}

variable "app_subnet_cidr" {
  type        = string
  description = "app subnet cidr"
  default     = "192.168.1.0/24"
}

variable "app_subnet_az" {
  type        = string
  description = "app subnet availabiliy zones"
  default     = "ap-south-1a"
}

variable "db_subnet_cidr" {
  type        = string
  description = "db subnet cidr"
  default     = "192.168.2.0/24"
}

variable "db_subnet_az" {
  type        = string
  description = "db subnet availability zones"
  default     = "ap-south-1a"
}