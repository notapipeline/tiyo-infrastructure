resource helm_release nginx {
  name       = "ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "kube-public"

  set {
    name  = "controller.service.type"
    value = "NodePort"
  }

  set {
    name  = "controller.service.httpPort.nodePort"
    value = "8380"
  }
  set {
    name  = "controller.service.httpsPort.nodePort"
    value = "8443"
  }
}

resource helm_release influxdb {
  name       = "influx"
  repository = "https://helm.influxdata.com"
  chart      = "influxdb2"
  namespace  = "influx"

  set {
    name  = "service.port"
    value = 8086
  }

  set {
    name  = "resources.requests.memory"
    value = "8Gi"
  }

  set {
    name  = "persistence.useExisting"
    value = true
  }

  set {
    name  = "persistence.name"
    value = "influx"
  }
}

