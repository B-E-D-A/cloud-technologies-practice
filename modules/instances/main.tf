terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_disk" "boot_disk" {
  name     = "${var.project_name}-boot-disk"
  zone     = var.zone
  image_id = var.image_id
  type     = var.instance_resources.disk.disk_type
  size     = var.instance_resources.disk.disk_size
}

resource "yandex_compute_instance" "this" {
  name                      = "${var.project_name}-linux-vm"
  allow_stopping_for_update = true
  platform_id               = var.instance_resources.platform_id
  zone                      = var.zone

  resources {
    cores  = var.instance_resources.cores
    memory = var.instance_resources.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot_disk.id
  }

  network_interface {
    subnet_id  = var.subnet_id
    ip_address = var.vm_internal_ip
  }

  metadata = {
    user-data = file("${path.module}/cloud-init.yaml")
  }
}

resource "null_resource" "provision" {
  depends_on = [yandex_compute_instance.this]

  provisioner "local-exec" {
    command = "echo 'VM ${var.project_name} created!'"
  }
}