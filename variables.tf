locals {
  default_tags = {
    terraform = true
  }
}
variable "region" {
  description = "The region in which the VPC should be deployed"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "ali-tf-vpc"
}
variable "vpc_cidr_block" {
  description = "VPC CIDR Block, default 10.42.0.0/16"
  type        = string
  default     = "10.42.0.0/16"
}
variable "newbits" {
  description = "Number of additional bits to extend vpc_cidr_block. Default 10"
  type        = number
  default     = 10
}

variable "nat_gateway_name" {
  description = "The name of the NAT-Gateway"
  type        = string
  default     = "default_nat_gw"
}
variable "subnet_cidrs" {
  description = "The subnets to create (vSwitch)"
  type        = list
  default     = [
    "10.42.0.1/24"
  ]
}

variable "subnets" {
  description = "This will create vSwitch (subnets)"
  type        = map
  default = {
    1 = "subnet-1"
    2 = "subnet-2"
  }
}
variable "enable_nat_gateway" {
  description = "Controls if a NAT-Gateway should be created"
  type        = bool
  default     = true
}
