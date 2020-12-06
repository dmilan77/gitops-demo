provider "google" {
  version = "~> 3.49.0"
  region  = "us-central1"
  # credentials = file("/xxxxx/xxxx/xxxx/account.json")
}
terraform {
  backend "gcs" {
    bucket  = "tfstate-data-protection-01"
    prefix  = "terraform/state/gke/gitops-demo"
  }
}

resource "google_container_cluster" "primary" {
  name               = "gitops-demo"
  project             = "data-protection-01"
  location           = "us-central1-a"
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
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
