provider "alicloud" {
  version = "~> 1.53"
  region  = var.region
}

resource "alicloud_vpc" "this" {
  name       = var.vpc_name
  cidr_block = var.vpc_cidr_block
}

resource "alicloud_vswitch" "this" {
  for_each = var.subnets
  vpc_id = alicloud_vpc.this.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 10, each.key)
  name = each.value
  depends_on = [
    "alicloud_vpc.this"
  ]
}

resource "alicloud_nat_gateway" "this" {
  vpc_id = alicloud.vpc.this
  name = var.vpc_gateway_name
}
