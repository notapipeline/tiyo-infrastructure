resource kubernetes_persistent_volume_claim pvc {
  count = length(var.volume) == 0 ? 0 : 1
  metadata {
    name      = var.volume.name
    namespace = var.namespace
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "${var.volume.size}Gi"
      }
    }
    volume_name = "${var.volume.name}-volume"
  }
}

