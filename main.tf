provider "alicloud" {
  version = "~> 1.53"
  region  = var.region
}

resource "alicloud_vpc" "this" {
  name       = var.vpc_name
  cidr_block = var.vpc_cidr_block
}

resource "alicloud_vswitch" "public_1" {
  vpc_id            = alicloud_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 10, 1)
  availability_zone = data.alicloud_zones.zones.0.id
  name              = "public-subnet-1"
  depends_on = [
    "alicloud_vpc.this"
  ]
}

resource "alicloud_vswitch" "public_2" {
  vpc_id            = alicloud_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 10, 2)
  availability_zone = data.alicloud_zones.zones.0.id
  name              = "public-subnet-2"
  depends_on = [
    "alicloud_vpc.this"
  ]
}

resource "alicloud_vswitch" "private_3" {
  vpc_id            = alicloud_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 10, 3)
  availability_zone = data.alicloud_zones.zones.0.id
  name              = "private-subnet-1"
  depends_on = [
    "alicloud_vpc.this"
  ]
}

resource "alicloud_vswitch" "private_4" {
  vpc_id            = alicloud_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 10, 4)
  availability_zone = data.alicloud_zones.zones.0.id
  name              = "private-subnet-2"
  depends_on = [
    "alicloud_vpc.this"
  ]
}

resource "alicloud_nat_gateway" "this" {
  vpc_id = alicloud.vpc.this
  name = var.vpc_gateway_name
}
