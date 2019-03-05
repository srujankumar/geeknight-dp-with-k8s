resource "kubernetes_replication_controller" "sample-app" {
  metadata {
    name = "sample-app"
    namespace = "${local.app_namespace}"
    labels {
      app = "sample-app"
    }
  }

  spec {
    replicas = 2
    selector {
      app = "sample-app"
    }
    template {
      container {
        image = "srujankumar/sample-node-app:latest"
        name  = "sample-node-app"

        port {
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
  depends_on = ["kubernetes_namespace.namespace"]
}