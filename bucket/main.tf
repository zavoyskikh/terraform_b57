variable "zone" {
  type = string
}
variable "folder_id" {
  type = string
}
# variable "vm_image_family" {
#   type = string
# }
# variable "vm_user" {
#   type = string
# }
# variable "ssh_key_path" {
#   type = string
# }
# variable "dns_zone" {
#   type = string
# }

variable "sa_name" {
  type = string
}

variable "bucket_name" {
  type = string
}



locals {
  # network_name       = "web-network"
  # subnet_name        = "subnet1"
  # sg_vm_name         = "sg-web"
  # vm_name            = "lemp-vm"
  # dns_zone_name      = "example-zone"
}

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.101.0"
    }
  }
  required_version = ">=  0.47.0"
}

provider "yandex" {
  zone      = var.zone
  folder_id = var.folder_id
}

resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = var.sa_name
}

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "сервисный ключ для задания"
}

resource "yandex_storage_bucket" "state" {
  bucket     = var.bucket_name
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
}

