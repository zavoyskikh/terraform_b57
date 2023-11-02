variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vm_image_family" {
  type    = string
  default = "lemp"
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "vm_user" {
  type    = string
  default = "admin"
}

variable "ssh_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"

}