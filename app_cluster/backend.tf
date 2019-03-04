terraform {
  backend "gcs" {
    bucket = "geeknight-hyd-demo"
    prefix = "app_cluster"
    project = "geeknight-hyd-demo"
  }
}
