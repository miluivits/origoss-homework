resource "kubernetes_service" "origoss_hw" {
  metadata {
    name = "${var.app_label}-service"
  }

  spec {
    selector = { app = var.app_label }

    port {
      port        = 8080
      target_port = 8080
    }

    type = var.service_type
  }
}
