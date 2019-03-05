resource "kubernetes_secret" "password" {
  provider = "kubernetes.${terraform.workspace}_kubernetes"
  metadata {
    namespace = "${local.app_namespace}"
    name      = "password"
  }

  data {
    value = "${random_string.random-password-generator.result}"
  }

  depends_on = ["kubernetes_namespace.namespace"]
}

resource "random_string" "random-password-generator" {
  length  = 16
  special = false
}