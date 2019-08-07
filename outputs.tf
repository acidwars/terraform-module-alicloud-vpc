output "vpc" {
  value = alicloud_vpc.this
}
output "vswitch" {
  value = alicloud_vswitch.this
}
output "nat_gateway" {
  value = alicloud_nat_gateway.this
}

