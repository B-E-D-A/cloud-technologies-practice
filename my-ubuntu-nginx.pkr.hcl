packer {
  required_plugins {
    yandex = {
      version = "~> 1"
      source  = "github.com/hashicorp/yandex"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}


source "yandex" "ubuntu-nginx" {
  service_account_key_file = "key.json"
  folder_id                = "b1gpfijokdsknlgc6s6m"
  source_image_family      = "ubuntu-2204-lts"
  ssh_username             = "ubuntu"
  use_ipv4_nat             = true
  image_description        = "my custom ubuntu with nginx"
  image_family             = "ubuntu-2204-lts"
  image_name               = "my-ubuntu-nginx-0"
  subnet_id                = "e9ber3flkeggpu0mnmac"
  disk_type                = "network-ssd"
  zone                     = "ru-central1-a"
}

build {
  sources = ["source.yandex.ubuntu-nginx"]

  provisioner "ansible" {
    playbook_file = "ansible/site.yml"
    user          = "ubuntu"
    use_proxy     = false
    extra_arguments = [
      "--extra-vars", "ansible_python_interpreter=/usr/bin/python3",
      "-v"
    ]
    ansible_env_vars = [
      "ANSIBLE_HOST_KEY_CHECKING=False",
      "ANSIBLE_SSH_RETRIES=5"
    ]
  }
}