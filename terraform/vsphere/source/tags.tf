resource vsphere_tag_category category {
  for_each    = var.tags
  name        = each.key
  description = "Managed by terraform"
  cardinality = "MULTIPLE"
  associable_types = [
    "VirtualMachine",
  ]
}

