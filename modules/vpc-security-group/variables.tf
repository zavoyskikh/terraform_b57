variable "network_id" {
  type = string
}

variable "ingress-settings" {
  type = map(object({
    port           = optional(number, -1)
    protocol       = optional(string, "tcp")
    v4_cidr_blocks = optional(list(string), ["0.0.0.0/0"])
  }))
  # default = {
  #   "Allow all" = { 
  #     port = -1
  #   }
  # }
}

variable "egress-settings" {
  type = map(object({
    port           = optional(number, -1)
    protocol       = optional(string, "ANY")
    v4_cidr_blocks = optional(list(string), ["0.0.0.0/0"])
  }))
}
