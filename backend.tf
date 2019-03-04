terraform {
  backend "gcs" {
    bucket = "geeknight-hyd-terraform-admin"
    prefix = "terraform/state"
    project = "geeknight-hyd-terraform-admin"
  }
}
