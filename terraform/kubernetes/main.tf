module namespace {
  for_each           = var.namespaces
  source             = "./source"
  namespace          = each.key
  volume             = contains(keys(var.volumes), each.key) ? var.volumes[each.key] : {}
  allowed_namespaces = contains(keys(var.allowed_namespaces), each.key) ? var.allowed_namespaces[each.key] : []
  port               = contains(keys(var.ports), each.key) ? var.ports[each.key] : 0
  domain             = var.domain

  depends_on = [
    kubernetes_persistent_volume.volume
  ]
}

