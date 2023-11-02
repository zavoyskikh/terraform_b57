terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.101.0"
    }
  }
  required_version = ">=  0.13"
}
resource "yandex_vpc_security_group" "sg" {
  name       = "http_security"
  network_id = var.network_id
  dynamic "egress" {
    for_each = var.egress-settings
    content {
      description    = egress.key
      port           = egress.value.port
      protocol       = egress.value.protocol
      v4_cidr_blocks = egress.value.v4_cidr_blocks
    }
  }

  dynamic "ingress" {
    for_each = var.ingress-settings
    content {
      description    = ingress.key
      port           = ingress.value.port
      protocol       = ingress.value.protocol
      v4_cidr_blocks = ingress.value.v4_cidr_blocks
    }
  }
}

