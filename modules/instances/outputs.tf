output "instance_id" { value = yandex_compute_instance.this.id }
output "boot_disk_id" { value = yandex_compute_disk.boot_disk.id }