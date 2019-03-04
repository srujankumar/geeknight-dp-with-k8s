resource "kubernetes_config_map" "test-details" {
  provider = "kubernetes.test_kubernetes"
  metadata {
    name      = "details"
    namespace = "${local.app_namespace}"
  }

  data {
    namespace       = "${local.app_namespace}"
    environment     = "test"
    password        = "${random_string.random-password-generator.result}"
  }
}
