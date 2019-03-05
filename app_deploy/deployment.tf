resource "kubernetes_deployment" "app1" {
  provider = "kubernetes.${terraform.workspace}_kubernetes"
  metadata {
    name = "app1"
    labels {
      purpose = "geeknight-demo"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels {
        purpose = "geeknight-demo"
      }
    }
    template {
      metadata {
        labels {
          purpose = "geeknight-demo"
        }
      }
      spec {
        container {
          image = "gcr.io/google-samples/hello-app:1.0"
          name  = "hello-app"
          port = {
            container_port = 8080
          }
        }
      }
    }
  }
}