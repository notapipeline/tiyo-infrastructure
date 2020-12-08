module tags {
  for_each    = var.tags
  source      = "./tags"
  category_id = vsphere_tag_category.category[each.key].id
  tags        = each.value
}
