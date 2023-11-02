variable "network_id" {
  description = "id сети"
  type        = string
}

variable "ingress-settings" {
  description = "параметры входящих фильтров"
  type = map(object({
    port           = optional(number, -1)
    protocol       = optional(string, "tcp")
    v4_cidr_blocks = optional(list(string), ["0.0.0.0/0"])
  }))
}

variable "egress-settings" {
  description = "параметры исходящих фильтров"
  type = map(object({
    port           = optional(number, -1)
    protocol       = optional(string, "ANY")
    v4_cidr_blocks = optional(list(string), ["0.0.0.0/0"])
  }))
}
