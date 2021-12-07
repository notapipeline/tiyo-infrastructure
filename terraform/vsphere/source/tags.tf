resource vsphere_tag_category sequencer {
  name        = "sequencer"
  description = "Managed by terraform"
  cardinality = "MULTIPLE"
  associable_types = [
    "VirtualMachine",
  ]
}

resource vsphere_tag sequencer {
  for_each    = var.sequencer_tags
  name        = each.key
  description = each.value
  category_id = vsphere_tag_category.sequencer.id
}

resource vsphere_tag_category sequencer_category {
  name        = "sequencer_categories"
  description = "Managed by terraform"
  cardinality = "MULTIPLE"
  associable_types = [
    "VirtualMachine",
  ]
}

resource vsphere_tag sequencer_category {
  for_each    = var.sequencer_categories
  name        = each.key
  description = each.value
  category_id = vsphere_tag_category.sequencer_category.id
}
