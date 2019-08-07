output "vpc" {
  value = alicloud_vpc.this
}
output "name" {
  value = "value"
}
output "vswitch" {
  value = alicloud_vswitch.*
}

