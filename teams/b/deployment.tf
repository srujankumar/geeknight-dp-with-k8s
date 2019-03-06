resource "kubernetes_deployment" "sample-app" {
  provider = "kubernetes.${terraform.workspace}_kubernetes"
  metadata {
    name = "sample-app"
    namespace = "${local.app_namespace}"
    labels {
      app = "sample-app"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels {
        app = "sample-app"
      }
    }
    template {
      metadata {
        labels {
          app = "sample-app"
        }
      }
      spec {
        container {
          image = "srujankumar/sample-node-app:latest"
          name  = "sample-app"
          port = {
            container_port = 3000
          }
          env {
            name = "ENV_PASSWORD"
            value_from {
              secret_key_ref {
                name = "password"
                key = "value"
              }
            }
          }
        }
      }
    }
  }

  depends_on = ["kubernetes_namespace.namespace"]
}