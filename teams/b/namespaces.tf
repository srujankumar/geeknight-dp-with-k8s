locals {
  app_namespace = "${local.team_name}"
}

resource "kubernetes_namespace" "test" {
  provider = "kubernetes.test_kubernetes"
  metadata {
    name = "${local.app_namespace}"
  }
}

