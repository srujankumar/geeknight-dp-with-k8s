resource "kubernetes_secret" "test-password" {
  provider = "kubernetes.test_kubernetes"
  metadata {
    namespace = "${local.app_namespace}"
    name      = "password"
  }

  data {
    value = "${random_string.random-password-generator.result}"
  }
}

resource "random_string" "random-password-generator" {
  length  = 16
  special = false
}