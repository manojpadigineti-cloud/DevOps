output "compute_private_ip" {
  value = google_compute_instance.compute.network_interface.0.network_ip
}

output "compute_public_ip" {
  value = google_compute_instance.compute.network_interface.0.access_config.0.nat_ip
}