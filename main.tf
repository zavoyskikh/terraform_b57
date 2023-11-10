
locals {
  vm_user              = "zvv"
  ssh_public_key_path  = "~/.ssh/id_rsa.pub"
  ssh_private_key_path = "~/.ssh/id_rsa"
  zone1                = "ru-central1-a"
  zone2                = "ru-central1-b"
  cidr1                = ["192.168.4.0/24"]
  cidr2                = ["192.168.2.0/24"]
  image1               = "lemp"
  image2               = "lamp"
}

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
    secret_key                  = "*****************************************"
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
  v4_cidr_blocks = local.cidr1
  zone           = local.zone1
  network_id     = yandex_vpc_network.network.id
}

resource "yandex_vpc_subnet" "devop_yc_subnet2" {
  name           = "subnet2"
  v4_cidr_blocks = local.cidr2
  zone           = local.zone2
  network_id     = yandex_vpc_network.network.id
}

module "security_group" {
  source           = "./modules/vpc-security-group"
  network_id       = yandex_vpc_network.network.id
  ingress-settings = { "Allow HTTP" = { port = 80 }, "Allow HTTPS" = { port = 443 }, "Allow SSH" = { port = 22 } }
  egress-settings  = { "Allow all" = { port = -1 } }
}

module "devop_vm_instance1" {
  source             = "./modules/instance"
  vm_image_family    = local.image1
  subnet_id          = yandex_vpc_subnet.devop_yc_subnet1.id
  zone               = local.zone1
  vm_user            = local.vm_user
  security_group_ids = [module.security_group.security_group_id]
}

module "devop_vm_instance2" {
  source             = "./modules/instance"
  vm_image_family    = local.image2
  subnet_id          = yandex_vpc_subnet.devop_yc_subnet2.id
  zone               = local.zone2
  vm_user            = local.vm_user
  ssh_key_path       = local.ssh_public_key_path
  security_group_ids = [module.security_group.security_group_id]


}

resource "null_resource" "create_html_file1" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = local.vm_user
      private_key = file(local.ssh_private_key_path)
      host        = module.devop_vm_instance1.external_ip
    }
    inline = [
      "sudo chown -R $USER:www-data /var/www/html",
      "sed -i '1i${module.devop_vm_instance1.external_ip}' /var/www/html/index.nginx-debian.html"
    ]
  }
}
resource "null_resource" "create_html_file2" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = local.vm_user
      private_key = file(local.ssh_private_key_path)
      host        = module.devop_vm_instance2.external_ip
    }
    inline = [
      "sudo chown -R $USER:www-data /var/www/html",
      "sed -i '1i${module.devop_vm_instance2.external_ip}' /var/www/html/index.html"
    ]
  }
}

resource "yandex_lb_target_group" "web_servers_group" {
  name = "web-servers-group"
  target {
    subnet_id = yandex_vpc_subnet.devop_yc_subnet1.id
    address   = module.devop_vm_instance1.internal_ip
  }
  target {
    subnet_id = yandex_vpc_subnet.devop_yc_subnet2.id
    address   = module.devop_vm_instance2.internal_ip
  }
}
resource "yandex_lb_network_load_balancer" "web_load_balancer" {
  name = "web-load-balancer"
  listener {
    name = "ext-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }

  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.web_servers_group.id
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }

}