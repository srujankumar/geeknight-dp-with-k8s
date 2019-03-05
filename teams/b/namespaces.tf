locals {
  app_namespace = "${local.team_name}"
}

resource "kubernetes_namespace" "namespace" {
  provider = "kubernetes.${terraform.workspace}_kubernetes"
  metadata {
    name = "${local.app_namespace}"
  }
}

