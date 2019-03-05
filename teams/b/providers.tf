provider "kubernetes" {
  alias = "${terraform.workspace}_kubernetes"
  version = "~> 1.2"
  config_path = "${local.kubeconfig_path}"
}

