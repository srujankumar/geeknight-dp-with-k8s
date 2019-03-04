provider "google" {
  version = "~> 2.1"
  region = "${var.region}"
}

resource "google_project_services" "project" {
  project = "${var.project_id}"
  services = [
    "compute.googleapis.com"
  ]
}
