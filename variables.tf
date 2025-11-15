variable "yc_token" {
  description = "Yandex Cloud IAM Token"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
  nullable    = false
}

variable "folder_id" {
  description = "Folder ID in Yandex Cloud"
  type        = string
  nullable    = false
}

variable "zone" {
  description = "Yandex Cloud Zone to provision resources"
  type        = string
  default     = "ru-central1-a"
}

variable "region" {
  description = "Yandex Cloud region (for YDB Serverless and regional resources)"
  type        = string
  default     = "ru-central1"
}

variable "name_prefix" {
  description = "Name prefix for project."
  type        = string
  default     = "project"
}

variable "image_id" {
  description = "Boot disk image id (Ubuntu 22.04)"
  type        = string
  default     = "fd8ba9d5mfvlncknt2kd"
  validation {
    condition     = length(var.image_id) > 8
    error_message = "image_id must be a non-empty Yandex Cloud image ID."
  }
}

variable "instance_resources" {
  description = "VM resources config"
  type = object({
    platform_id = optional(string, "standard-v3")
    cores       = number
    memory      = number
    disk = optional(object({
      disk_type = optional(string, "network-ssd")
      disk_size = optional(number, 15)
    }), {})
  })
  default = {
    cores  = 2
    memory = 2
  }
}

variable "subnets" {
  description = "Map of subnet names to CIDR blocks"
  type        = map(list(string))
  default = {
    "default-subnet" = ["192.168.10.0/24"]
  }
}