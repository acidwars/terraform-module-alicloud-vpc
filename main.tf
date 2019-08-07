provider "alicloud" {
  version = "~> 1.53"
  region  = var.region
}

resource "alicloud_vpc" "this" {
  name       = var.vpc_name
  cidr_block = var.vpc_cidr_block
}

resource "alicloud_vswitch" "this" {
  for_each          = var.subnets
  vpc_id            = alicloud_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 10, each.key)
  name              = each.value
  availability_zone = data.alicloud_zones.default.0.id
  depends_on = [
    "alicloud_vpc.this"
  ]
}

resource "alicloud_nat_gateway" "this" {
  count  = var.enable_nat_gateway ? 1 : 0
  vpc_id = alicloud_vpc.this
  name   = var.nat_gateway_name
  depends_on = [
    "alicloud_vpc.this"
  ]
}
