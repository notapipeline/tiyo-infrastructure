resource kubernetes_ingress service_ingress {
  count = var.port == 0 ? 0 : 1
  metadata {
    name      = var.namespace
    namespace = var.namespace
  }

  spec {
    backend {
      service_name = var.namespace
      service_port = var.port
    }

    rule {
      host = "${var.namespace}-${var.domain}"
      http {
        path {
          backend {
            service_name = var.namespace
            service_port = var.port
          }
          path = ""
        }
      }
    }
  }
}

