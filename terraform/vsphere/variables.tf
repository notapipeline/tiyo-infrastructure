/**
 * Provider variables
 */

variable vsphere_server {
  description = "The vsphere server to deploy to"
}

/**
 * Datacenter variables
 */
variable datacenter {
  description = "The datacenter to build this stack inside"
}

variable cluster {
  description = "The compute cluster to build hosts in"
}

variable datastorecluster {
  description = "The datastore cluster to pull templates from"
}

variable domain {
  description = "The DNS domain for hosts to use"
}

variable dns_servers {
  type        = list
  description = "A list of DNS server addresses to apply to VMs"
}

/**
 * Virtual application descriptors
 */
variable vapps {
  description = "A map of virtual application pools"
  type = map(object({
    network   = string
    subnet    = number
    gateway   = string
    master    = map(string)
    nodes     = map(string)
    filestore = string
  }))
}

variable template_path {
  description = "The template to use for the base image"
}

