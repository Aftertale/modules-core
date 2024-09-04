resource "google_service_account" "this" {
  account_id   = local.cluster_full_name
  display_name = "Cluster Identity"
}

resource "google_container_cluster" "this" {
  name               = local.cluster_full_name
  location           = var.location
  initial_node_count = 1
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = local.tags
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}
