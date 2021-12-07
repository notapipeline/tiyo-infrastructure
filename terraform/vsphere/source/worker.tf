resource vsphere_virtual_machine worker {
  for_each             = var.network.nodes
  name                 = each.key
  resource_pool_id     = vsphere_vapp_container.vapp_container.id
  datastore_cluster_id = var.datastore.id

  num_cpus = 4
  memory   = 16384

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
    size             = 100
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 1
  }

  wait_for_guest_net_timeout = 0
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = each.key
        domain    = var.domain
      }

      network_interface {
        ipv4_address = each.value
        ipv4_netmask = var.network.subnet
      }

      ipv4_gateway    = var.network.gateway
      dns_server_list = var.dns_servers
    }
  }

  tags = local.worker_tags
}

