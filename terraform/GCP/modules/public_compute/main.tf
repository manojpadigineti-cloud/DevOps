resource "google_compute_instance" "compute" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  network_interface {
    network = var.vpc_name
    subnetwork = var.subnet

    access_config {
      // Ephemeral public IP
    }
  }


  boot_disk {
    initialize_params {
      image = var.image_name
      labels = {
        "name" = var.vm_name
      }
    }
  }
    metadata = {
    ssh-keys = var.private_key
    ssh-keys = var.public_key
  }
}
