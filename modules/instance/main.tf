terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.101.0"
    }
  }
  required_version = ">=  0.13"

}

resource "yandex_compute_image" "vm-image" {
  source_family = var.vm_image_family
}

resource "yandex_compute_instance" "vm" {
  name        = "vm-${var.vm_image_family}"
  platform_id = "standard-v3"
  zone        = var.zone
  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }
  boot_disk {
    initialize_params {
      image_id = yandex_compute_image.vm-image.id
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = true
    security_group_ids = var.security_group_ids

  }

  metadata = {
    # user-data = "#cloud-config\nusers:\n  - name: ${var.vm_user}\n    groups: sudo\n    shell: /bin/bash\n    sudo: 'ALL=(ALL) NOPASSWD:ALL'\n    ssh-authorized-keys:\n      - ${file("${var.ssh_key_path}")}"
    user-data = templatefile("${path.module}/vm-config.yaml", {
      vm_user      = var.vm_user
      ssh_key_path = file(var.ssh_key_path)
    })
  }
}