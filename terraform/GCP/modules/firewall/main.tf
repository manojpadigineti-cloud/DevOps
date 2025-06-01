resource "google_compute_firewall" "default" {
  name    = var.firewall_name
  network = var.vpc_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = var.protocol
    ports    = var.ports
  }
  source_ranges = var.source_cidr_range
}






