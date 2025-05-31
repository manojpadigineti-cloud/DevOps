resource "google_compute_firewall" "default" {
  for_each = var.firewall_ports
  name    = var.firewall_name
  network = var.vpc_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

  source_ranges = each.value.source_cidr_range
}



