variable datacenter {
  description = "The datacenter to be built inside of"
}

variable cluster {
  description = "the device cluster to launch instances on"
}

variable datastore {
  description = "the datastore to launch instances on"
}

variable domain {
  description = "The DNS Domain to launch instances on"
}

variable dns_servers {
  type        = list
  description = "A list of DNS server addresses to apply to VMs"
}

variable vapp_name {
  description = "The name of the virtual application to build"
}

variable network {
  description = "The network to build this virtual application in"
  type = object({
    network   = string
    subnet    = number
    gateway   = string
    filestore = string
    master    = map(string)
    nodes     = map(string)
  })
}

variable template_path {
  description = "The template to use for the base image"
}

variable tags {
  description = "A map of tag categories and list of tags to create under each category"
  type        = map(map(string))
  default = {
    default = {
      managed_by    = "Terraform"
      configured_by = "Ansible"
      owned_by      = "Martin Proffitt"
      mail_to       = "martin.proffitt@dxc.com"
    }
    filestore = {
      name        = "rna-filestore",
      description = "RNA host for persistent storage"
    },
    master = {
      name        = "rna-master-node"
      description = "Master node for RNA sequencing computational effort"
    },
    worker = {
      name        = "rna-sequencing-worker-node"
      description = "A worker node for RNA sequencingq"
    }
  }
}

locals {
  filestore_tags = concat(module.tags["default"].tag_ids, module.tags["filestore"].tag_ids)
  master_tags    = concat(module.tags["default"].tag_ids, module.tags["master"].tag_ids)
  worker_tags    = concat(module.tags["default"].tag_ids, module.tags["worker"].tag_ids)
}
