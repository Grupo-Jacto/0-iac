resource "google_service_account" "service_account_vm" {
  account_id   = var.project_id
  display_name = var.service_user_name
  project      = var.project_id
}

resource "google_compute_instance" "vm" {
  count        = var.vm_count
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.vm_zone

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
  tags = ["Name", var.vm_name]
}

resource "google_compute_firewall" "vm_firewall" {
  name          = var.vm_firewall_name
  network       = google_compute_instance.vm[0].network_interface[0].name
  source_ranges = var.source_ranges
  allow {
    protocol = var.vm_firewall_allow_protocols
    ports    = var.vm_firewall_allow_ports
  }
}