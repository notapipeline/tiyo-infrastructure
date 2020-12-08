resource vsphere_vapp_container vapp_container {
  name                    = var.vapp_name
  parent_resource_pool_id = var.cluster.resource_pool_id
}

