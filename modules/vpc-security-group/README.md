# vpc-security-group

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
| [yandex_vpc_security_group.sg](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egress-settings"></a> [egress-settings](#input\_egress-settings) | параметры исходящих фильтров | <pre>map(object({<br>    port           = optional(number, -1)<br>    protocol       = optional(string, "ANY")<br>    v4_cidr_blocks = optional(list(string), ["0.0.0.0/0"])<br>  }))</pre> | n/a | yes |
| <a name="input_ingress-settings"></a> [ingress-settings](#input\_ingress-settings) | параметры входящих фильтров | <pre>map(object({<br>    port           = optional(number, -1)<br>    protocol       = optional(string, "tcp")<br>    v4_cidr_blocks = optional(list(string), ["0.0.0.0/0"])<br>  }))</pre> | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | id сети | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
