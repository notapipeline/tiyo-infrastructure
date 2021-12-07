resource kubernetes_persistent_volume volume {
  for_each = var.volumes
  metadata {
    name = "${each.value.name}-volume"
  }

  spec {
    persistent_volume_reclaim_policy = "Retain"
    capacity = {
      storage = "${each.value.size}Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      nfs {
        server = var.nfs_server
        path   = "/${each.value.name}"
      }
    }
  }
}

