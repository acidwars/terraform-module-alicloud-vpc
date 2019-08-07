provider "alicloud" {
  version = "~> 1.53"
  region  = var.region
}

resource "alicloud_vpc" "this" {
  name       = var.vpc_name
  cidr_block = var.vpc_cidr_block
}

resource "alicloud_vswitch" "this" {
  for_each          = var.subnet_cidrs
  vpc_id            = alicloud_vpc.this.id
  cidr_block        = each.value
  name              = each.value
  availability_zone = length(var.availability_zones) > 0 ? element(var.availability_zones, count.index) : lookup(data.alicloud_zones.default.zones[each.index].id) 
  depends_on = [
    "alicloud_vpc.this"
  ]
}

resource "alicloud_nat_gateway" "this" {
  count  = var.enable_nat_gateway ? 1 : 0
  vpc_id = alicloud_vpc.this.id
  name   = var.nat_gateway_name
  depends_on = [
    "alicloud_vpc.this"
  ]
}
