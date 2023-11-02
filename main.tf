
terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.101.0"
    }
  }
  required_version = ">=  0.13"
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "b553bucket"
    region                      = "ru-central1-a"
    key                         = "B57/mybucket.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    access_key                  = "YCAJEURJsvB_kRb-TfJOxMULs"
    secret_key                  = "YCPXO2GKfmGD1274YTZ5StVbHeJwzXY8-OsJ8FX3"
  }
}

provider "yandex" {
  zone = "ru-central1-b"
  #    folder_id = "b1gshrppcjhgfj180qki"
}


resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "devop_yc_subnet1" {
  name           = "subnet1"
  v4_cidr_blocks = ["192.168.4.0/24"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
}

resource "yandex_vpc_subnet" "devop_yc_subnet2" {
  name           = "subnet2"
  v4_cidr_blocks = ["192.168.2.0/24"]
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network.id
}

module "security_group" {
  source           = "./modules/vpc-security-group"
  network_id       = yandex_vpc_network.network.id
  ingress-settings = { "Allow HTTP" = { port = 80 }, "Allow HTTPS" = { port = 443 }, "Allow SSH" = { port = 22 } }
  egress-settings  = { "Allow all" = { port = -1 } }
}

module "devop_vm_instance1" {
  source          = "./modules/instance"
  vm_image_family = "lemp"
  subnet_id       = yandex_vpc_subnet.devop_yc_subnet1.id
  #  zone = "ru-central1-a"
  security_group_ids = [module.security_group.security_group_id]
}

module "devop_vm_instance2" {
  source             = "./modules/instance"
  vm_image_family    = "lamp"
  subnet_id          = yandex_vpc_subnet.devop_yc_subnet2.id
  zone               = "ru-central1-b"
  security_group_ids = [module.security_group.security_group_id]
}
