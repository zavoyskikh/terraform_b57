output "external_ip_1" {
  description = "Внешний IP"
  value       = module.devop_vm_instance1.external_ip
}
output "internal_ip_1" {
  description = "Внутренний IP"
  value       = module.devop_vm_instance1.internal_ip
}
output "external_ip_2" {
  description = "Внешний IP"
  value       = module.devop_vm_instance2.external_ip
}

output "internal_ip_2" {
  description = "Внутренний IP"
  value       = module.devop_vm_instance1.internal_ip
}

output "lb_external_ip" {
  description = "Внешний IP Load Balancer"
  #value       = [for s in yandex_lb_network_load_balancer.web_load_balancer.listener : s.external_address_spec.0].0
  #value = yandex_lb_network_load_balancer.web_load_balancer.listener[*].external_address_spec[0][*].address
  value = [for s in yandex_lb_network_load_balancer.web_load_balancer.listener : s.external_address_spec][0][*].address
}