resource "kubernetes_service" "sample-app" {
  metadata {
    name = "sample-app"
    namespace = "${local.app_namespace}"

    labels {
      app  = "sample-app"
    }
  }

  spec {
    selector {
      app  = "sample-app"
    }

    port {
      port        = 80
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}

output "lb_ip" {
  value = "${kubernetes_service.sample-app.load_balancer_ingress.0.ip}"
}