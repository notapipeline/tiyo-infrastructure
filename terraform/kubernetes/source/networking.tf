resource kubernetes_network_policy influx {
  count = var.port == 0 ? 0 : 1
  metadata {
    name      = var.namespace
    namespace = var.namespace
  }

  spec {
    pod_selector {}

    ingress {
      ports {
        port     = var.port
        protocol = "TCP"
      }

      dynamic from {
        for_each = var.allowed_namespaces
        content {
          namespace_selector {
            match_labels = {
              name = from.value
            }
          }
        }
      }
    }

    egress {}

    policy_types = ["Ingress", "Egress"]
  }
}

