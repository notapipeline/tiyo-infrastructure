data vsphere_datacenter dc {
  name = var.datacenter
}

data vsphere_compute_cluster compute_cluster {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data vsphere_datastore_cluster datastore_cluster {
  name          = var.datastorecluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

