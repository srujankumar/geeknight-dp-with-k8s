resource "kubernetes_config_map" "details" {
  provider = "kubernetes.${terraform.workspace}_kubernetes"
  metadata {
    name      = "details"
    namespace = "${local.app_namespace}"
  }

  data {
    namespace       = "${local.app_namespace}"
    environment     = "${terraform.workspace}"
    password        = "${random_string.random-password-generator.result}"
  }

  depends_on = ["kubernetes_namespace.namespace"]
}
