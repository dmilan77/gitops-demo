resource "google_container_cluster" "primary" {
  name               = "gitops-demo"
  location           = "us-central1-a"
  initial_node_count = 3
  network   = google_compute_subnetwork.gitops_gke_subnetwork_us_central1.id

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
