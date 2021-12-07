resource vsphere_virtual_machine filestore {
  name                 = "seq-filestore"
  resource_pool_id     = vsphere_vapp_container.vapp_container.id
  datastore_cluster_id = var.datastore.id

  num_cpus = 2
  memory   = 2048

  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true
  memory_hot_add_enabled = true

  guest_id = data.vsphere_virtual_machine.template.guest_id

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  disk {
    label            = "disk1"
    size             = 500
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 1
  }

  disk {
    label            = "disk2"
    size             = 500
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 2
  }

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "seq-filestore"
        domain    = var.domain
      }

      network_interface {
        ipv4_address = var.network.filestore
        ipv4_netmask = var.network.subnet
      }

      ipv4_gateway    = var.network.gateway
      dns_server_list = var.dns_servers
    }
  }

  tags = local.filestore_tags
}

