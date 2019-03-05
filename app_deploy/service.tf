resource "kubernetes_service" "app1" {
  provider = "kubernetes.${terraform.workspace}_kubernetes"
  metadata {
    name = "app1"
  }
  spec {
    selector {
      purpose = "${kubernetes_deployment.app1.metadata.0.labels.purpose}"
    }
    session_affinity = "ClientIP"
    port {
      port = 8080
      target_port = 8080
    }
    type = "NodePort"
  }
}