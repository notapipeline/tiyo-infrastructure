variable namespace {
  description = "The namespace to create"
}

variable volume {
  description = "The name to give the volume claim - normally the remote mount directory name"
}

variable port {
  description = "The port this service allows inbound"
}

variable allowed_namespaces {
  description = "A set of namespace names that are allowed to talk in to this namespace"
}

variable domain {
  description = "The domain name to bind to"
}
