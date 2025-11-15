output "network_id" { value = module.network.network_id }
output "subnet_id" { value = module.network.subnet_id }
output "vm_instance_id" { value = module.instances.instance_id }
output "vm_boot_disk_id" { value = module.instances.boot_disk_id }
output "bucket_name" { value = module.db.bucket_name }
output "bucket_sa_id" { value = module.db.service_account_id }
output "ydb_name" { value = module.db.ydb_name }
output "ydb_endpoint" { value = module.db.ydb_endpoint }
