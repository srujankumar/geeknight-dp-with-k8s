terraform {
  backend "gcs" {
    bucket = "geeknight-hyd-demo"
    prefix = "team_b"
    project = "geeknight-hyd-demo"
  }
}
