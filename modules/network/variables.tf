variable "project_name" { type = string }
variable "zone" { type = string }
variable "subnets" { type = map(list(string)) }
variable "subnet_name" { type = string }
