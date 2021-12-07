variable nfs_server {
  description = "The address of the NFS server to mount volumes from"
}

variable domain {
  description = "The domain name services will be bound against to form an FQDN"
}

variable namespaces {
  description = "A set of namespaces to create across the cluster"
  type        = set(string)
  default = [
    "sequencer",
    "elastic",
    "influx",
  ]
}

variable volumes {
  description = "A map of remote directory names and sizes to allocate"
  type = map(object({
    name = string
    size = number
  }))
  default = {
    sequencer = {
      name = "data"
      size = 800
    }
    influx = {
      name = "influx"
      size = 50
    }
  }
}

variable ports {
  description = "A map of services to port numbers"
  default = {
    redis   = 6379
    elastic = 9300
    influx  = 8086
  }
}

variable allowed_namespaces {
  description = "A map of allowed_namespaces in each namespace"
  type        = map(set(string))
  default = {
    sequencer = []
    elastic   = ["sequencer"]
    redis     = ["sequencer", "elastic"]
  }
}

