variable "zone" {
  description = "зоан, по умолчанию ru-central1-a"
  type        = string
  default     = "ru-central1-a"
}

variable "vm_image_family" {
  description = "дистрибутив, по умолчанию lemp"
  type        = string
  default     = "lemp"
}

variable "subnet_id" {
  description = "id сети, обязательно"
  type        = string
}

variable "security_group_ids" {
  description = "ids групп безопасности, обязательн"
  type        = list(string)
}

variable "vm_user" {
  description = "имя пользователя виртуальной машины"
  type        = string
  default     = "admin"
}

variable "ssh_key_path" {
  description = "путь к файлу публичного ключа"
  type        = string
  default     = "~/.ssh/id_rsa.pub"

}
