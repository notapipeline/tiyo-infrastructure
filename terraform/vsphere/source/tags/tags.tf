resource vsphere_tag tag {
  for_each    = var.tags
  name        = each.key
  description = each.value
  category_id = var.category_id
}
