/**
 * Enable vapps here
 */

module vapps {
  for_each      = var.vapps
  source        = "./source"
  vapp_name     = each.key
  datacenter    = data.vsphere_datacenter.dc
  cluster       = data.vsphere_compute_cluster.compute_cluster
  datastore     = data.vsphere_datastore_cluster.datastore_cluster
  dns_servers   = var.dns_servers
  domain        = var.domain
  network       = each.value
  template_path = var.template_path
}

