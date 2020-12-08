data vsphere_network network {
  name          = var.network.network
  datacenter_id = var.datacenter.id
}

data vsphere_virtual_machine template {
  name          = var.template_path
  datacenter_id = var.datacenter.id
}

