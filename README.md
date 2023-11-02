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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_devop_vm_instance1"></a> [devop\_vm\_instance1](#module\_devop\_vm\_instance1) | ./modules/instance | n/a |
| <a name="module_devop_vm_instance2"></a> [devop\_vm\_instance2](#module\_devop\_vm\_instance2) | ./modules/instance | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | ./modules/vpc-security-group | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.devop_yc_subnet1](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.devop_yc_subnet2](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_1"></a> [external\_ip\_1](#output\_external\_ip\_1) | Внешний IP |
| <a name="output_external_ip_2"></a> [external\_ip\_2](#output\_external\_ip\_2) | Внешний IP |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN_TF_DOCS -->
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | ./modules/vpc-security-group | 0.1 |
| <a name="module_vm-instance-1"></a> [vm-instance-1](#module\_vm-instance-1) | ./modules/instance | 0.1 |
| <a name="module_vm-instance-2"></a> [vm-instance-2](#module\_vm-instance-2) | ./modules/instance | 0.1 |

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet-1](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.subnet-2](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_1"></a> [external\_ip\_1](#output\_external\_ip\_1) | Внешний IP |
| <a name="output_external_ip_2"></a> [external\_ip\_2](#output\_external\_ip\_2) | Внешний IP |
<!-- END_TF_DOCS -->