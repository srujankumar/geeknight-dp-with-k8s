provider "google" {
  version = "~> 2.1"
  region = "${var.region}"
  credentials = "${file("~/.config/gcloud/geeknight-hyd-demo.json")}"
  project     = "${var.project_id}"
}

provider "null" {}