output "external_ip_1" {
  description = "Внешний IP"
  value       = module.devop_vm_instance1.external_ip
}
output "external_ip_2" {
  description = "Внешний IP"
  value       = module.devop_vm_instance2.external_ip
}


