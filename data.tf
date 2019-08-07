data "alicloud_zones" "default" {
  network_type = "Vpc"
}
data "alicloud_instance_types" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
}
