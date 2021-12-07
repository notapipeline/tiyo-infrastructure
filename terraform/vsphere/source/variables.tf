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

variable sequencer_tags {
  description = "A map of tag categories and list of tags to create under each category"
  type        = map(string)
  default = {
    name          = "RNA Sequencer"
    managed_by    = "Terraform"
    configured_by = "Ansible"
    owned_by      = "Martin Proffitt"
    mail_to       = "martin.proffitt@dxc.com"
  }
}

variable sequencer_categories {
  description = "A map of tag categories and list of tags to create under each category"
  type        = map(string)
  default = {
    filestore = "Shared storage for the cluster",
    master    = "Master node for RNA sequencing computational effort"
    worker    = "A worker node for RNA sequencingq"
    cluster   = "A machine that is part of the overall cluster"
  }
}

locals {
  filestore_tags = concat(
    [
      for item in vsphere_tag.sequencer : item.id
    ],
    [
      vsphere_tag.sequencer_category["filestore"].id,
    ]
  )
  worker_tags = concat(
    [
      for item in vsphere_tag.sequencer : item.id
    ],
    [
      vsphere_tag.sequencer_category["worker"].id,
      vsphere_tag.sequencer_category["cluster"].id,
    ]
  )
  master_tags = concat(
    [
      for item in vsphere_tag.sequencer : item.id
    ],
    [
      vsphere_tag.sequencer_category["master"].id,
      vsphere_tag.sequencer_category["cluster"].id,
    ]
  )
}
