provider "kubernetes" {
  alias = "test_kubernetes"
  version = "~> 1.2"
  config_path = "${local.test_kubeconfig_path}"
}

