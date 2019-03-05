terraform {
  backend "gcs" {
    bucket = "geeknight-hyd-demo"
    prefix = "app_deploy"
    project = "geeknight-hyd-demo"
  }
}
