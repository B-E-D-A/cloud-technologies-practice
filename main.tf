locals {
  project_name   = var.name_prefix
  subnet_name    = keys(var.subnets)[0]
  vm_internal_ip = cidrhost(var.subnets[local.subnet_name][0], 10)
}

module "network" {
  source       = "./modules/network"
  project_name = local.project_name
  zone         = var.zone
  subnets      = var.subnets
  subnet_name  = local.subnet_name
}

module "instances" {
  source             = "./modules/instances"
  project_name       = local.project_name
  zone               = var.zone
  image_id           = var.image_id
  instance_resources = var.instance_resources
  subnet_id          = module.network.subnet_id
  vm_internal_ip     = local.vm_internal_ip
}

module "db" {
  source       = "./modules/db"
  project_name = local.project_name
  folder_id    = var.folder_id
  region       = var.region
}
