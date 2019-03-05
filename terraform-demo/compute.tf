resource "google_compute_instance" "demo" {
  project = "${var.project_id}"
  zone = "${var.zone}"
  name = "tf-compute-1"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}

output "instance_id" {
  value = "${google_compute_instance.demo.self_link}"
}