resource "google_service_account" "service_account_vm" {
  account_id   = var.account_id
  display_name = var.service_user_name
}

resource "google_compute_instance" "vm" {
  count = var.vm_count
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.vm_zone
  
  tags = var.vm_tags

  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = var.vm_disk_interface
  }

  network_interface {
    network = var.vm_network_interface
    access_config {
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.service_account_vm.email
    scopes = var.vm_service_account_scopes
  }
}

resource "google_compute_firewall" "vm_firewall" {
  name    = var.vm_firewall_name
  network = google_compute_instance.vm.network_interface.name

  allow {
    protocol = var.vm_firewall_allow_protocols
    ports    = var.vm_firewall_allow_ports
  }

  source_tags = var.vm_tags
}