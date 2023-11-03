# instance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >=0.101.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.101.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_image.vm-image](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_image) | resource |
| [yandex_compute_instance.vm](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | ids групп безопасности, обязательн | `list(string)` | n/a | yes |
| <a name="input_ssh_key_path"></a> [ssh\_key\_path](#input\_ssh\_key\_path) | путь к файлу публичного ключа | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | id сети, обязательно | `string` | n/a | yes |
| <a name="input_vm_image_family"></a> [vm\_image\_family](#input\_vm\_image\_family) | дистрибутив, по умолчанию lemp | `string` | `"lemp"` | no |
| <a name="input_vm_user"></a> [vm\_user](#input\_vm\_user) | имя пользователя виртуальной машины | `string` | `"admin"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | зоан, по умолчанию ru-central1-a | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | n/a |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
