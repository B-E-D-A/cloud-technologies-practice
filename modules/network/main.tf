terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_network" "this" {
  name = "${var.project_name}-vpc"
}

resource "yandex_vpc_subnet" "private" {
  name           = var.subnet_name
  zone           = var.zone
  v4_cidr_blocks = var.subnets[var.subnet_name]
  network_id     = yandex_vpc_network.this.id
}

