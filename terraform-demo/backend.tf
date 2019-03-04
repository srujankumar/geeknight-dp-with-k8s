terraform {
  backend "gcs" {
    bucket = "geeknight-hyd-demo"
    prefix = "terraform-demo"
    project = "geeknight-hyd-demo"
  }
}
