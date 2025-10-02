# terraform/deployment.tf
resource "kubernetes_deployment" "origoss_hw" {
  metadata {
    name   = "origoss-hw-deployment"
    labels = { app = var.app_label }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = { app = var.app_label }
    }

    template {
      metadata {
        labels = { app = var.app_label }
      }

      spec {
        container {
          name  = var.app_label
          image = var.image

          port {
            container_port = 8080
          }

          # resource requests/limits (éles környezethez)
          # resources {
          #   limits = { cpu = "250m", memory = "256Mi" }
          #   requests = { cpu = "100m", memory = "128Mi" }
          # }

          # Optional: probes
          # liveness_probe {
          #   http_get {
          #     path = "/"
          #     port = 8080
          #   }
          #   initial_delay_seconds = 10
          #   period_seconds = 10
          # }
          # readiness_probe {
          #   http_get {
          #     path = "/"
          #     port = 8080
          #   }
          #   initial_delay_seconds = 5
          #   period_seconds = 5
          # }
        }
      }
    }
  }
}
