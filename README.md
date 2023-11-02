# B5.7

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >=0.101.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |
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
| [null_resource.create_html_file1](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.create_html_file2](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [yandex_lb_network_load_balancer.web_load_balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer) | resource |
| [yandex_lb_target_group.web_servers_group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_target_group) | resource |
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
| <a name="output_internal_ip_1"></a> [internal\_ip\_1](#output\_internal\_ip\_1) | Внутренний IP |
| <a name="output_internal_ip_2"></a> [internal\_ip\_2](#output\_internal\_ip\_2) | Внутренний IP |
| <a name="output_lb_external_ip"></a> [lb\_external\_ip](#output\_lb\_external\_ip) | Внешний IP Load Balancer |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
