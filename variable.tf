#forcing the user to give value
variable "cidr_block" {
  
}

variable "enable_dns_hostnames" {
    default = true
}

variable "enable_dns_support" {
    default = true
}


variable "project_name" {
  
}


#even t is optonal good to give 
variable "common_tags" {
    default = {}
}

variable "vpc_tags" {
    default = {}
}

variable "igw_tags" {
    default = {}
  
}

variable "public_subnet_cidr" {
validation {
    condition = length(var.public_subnet_cidr) == 2
    error_message = "please provide the 2 public subnet cidr"
  }
  
}


variable "private_subnet_cidr" {
validation {
    condition = length(var.private_subnet_cidr) == 2
    error_message = "please provide the 2 private subnet cidr"
  }
  
}


variable "database_subnet_cidr" {
validation {
    condition = length(var.database_subnet_cidr) == 2
    error_message = "please provide the 2 database subnet cidr"
  }
  
}

variable "nat_gateway_tags" {
  default = {}
}

variable "public_route_table_tags" {
    default = {}
  
}

variable "private_route_table_tags" {
    default = {}
  
}

variable "database_route_table_tags" {
    default = {}
  
}


variable "db_subnet_tags" {
    default = {}
  
}



