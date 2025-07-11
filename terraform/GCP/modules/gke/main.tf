resource "google_container_cluster" "gke_cluster" {
  name     = var.name
  location = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection = false
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.nodepool_name
  location   = var.nodepool_region
  cluster    = google_container_cluster.gke_cluster.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
  }
}
