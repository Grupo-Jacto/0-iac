output "service_user_vm_id" {
  value = google_service_account.service_account_vm.account_id
}

output "service_user_vm_name" {
  value = google_service_account.service_account_vm.display_name
}

output "vm_id" {
  value = google_compute_instance.vm.id
}

output "vm_name" {
  value = google_compute_instance.vm.name
}

output "vm_machine_type" {
  value = google_compute_instance.vm.machine_type
}

output "vm_zone" {
  value = google_compute_instance.vm.zone
}

output "vm_image" {
  value = google_compute_instance.vm.boot_disk.initialize_params.image
}

output "vm_private_ip" {
  value = google_compute_instance.vm.ipv4
}

#VM Firewall
output "vm_firewall_id" {
  value = google_compute_firewall.vm_firewall.id
}

output "vm_firewall_name" {
  value = google_compute_firewall.vm_firewall.name
}

output "vm_firewall_allowed_protocol" {
  value = google_compute_firewall.vm_firewall.allow.protocol
}

output "vm_firewall_allow_ports" {
  value = google_compute_firewall.vm_firewall.allow.ports
}