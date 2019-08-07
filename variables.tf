locals {
  default_tags = {
    terraform = true
  }
}

variable "vpc_name" {
  type    = string
  default = "ali-tf-vpc"
}
variable "vpc_cidr_block" {
  type    = string
  default = "10.42.0.0/24"
}
variable "vpc_gateway_name" {
  type = string
  default = "default_nat_gw"
}
variable "subnets" {
  type = map
  default = {
    1 = "subnet-1"
    2 = "subnet-2"
  } 
}
