variable "project_name" { type = string }
variable "zone" { type = string }
variable "image_id" { type = string }
variable "instance_resources" { type = object({
  platform_id = optional(string, "standard-v3")
  cores       = number
  memory      = number
  disk = optional(object({
    disk_type = optional(string, "network-ssd")
    disk_size = optional(number, 15)
  }), {})
})}
variable "subnet_id" { type = string }
variable "vm_internal_ip" { type = string }
