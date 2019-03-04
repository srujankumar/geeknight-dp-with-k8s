terraform {
  backend "gcs" {
    bucket = "geeknight-hyd-demo"
    prefix = "team_a"
    project = "geeknight-hyd-demo"
  }
}
