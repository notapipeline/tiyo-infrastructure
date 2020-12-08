output tag_ids {
  value = [for item in vsphere_tag.tag : item.id]
}
