output "bucket_name" { value = yandex_storage_bucket.this.bucket }
output "service_account_id" { value = yandex_iam_service_account.bucket.id }
output "ydb_name" { value = yandex_ydb_database_serverless.this.name }
output "ydb_endpoint" { value = yandex_ydb_database_serverless.this.document_api_endpoint }
