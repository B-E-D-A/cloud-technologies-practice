terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 0.13"
}

resource "random_string" "bucket_name" {
  length  = 8
  special = false
  upper   = false
}

resource "yandex_iam_service_account" "bucket" {
  name = "${var.project_name}-bucket-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "storage_editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket.id}"
}

resource "yandex_iam_service_account_static_access_key" "this" {
  service_account_id = yandex_iam_service_account.bucket.id
  description        = "static access key for object storage"
}

resource "yandex_storage_bucket" "this" {
  bucket     = "${var.project_name}-terraform-bucket-${random_string.bucket_name.result}"
  access_key = yandex_iam_service_account_static_access_key.this.access_key
  secret_key = yandex_iam_service_account_static_access_key.this.secret_key

  depends_on = [yandex_resourcemanager_folder_iam_member.storage_editor]
}

resource "yandex_ydb_database_serverless" "this" {
  name        = "${var.project_name}-ydb-serverless"
  location_id = var.region
}

