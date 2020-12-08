provider "vsphere" {
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

provider local {}
provider template {}
terraform {
  backend "s3" {
    region         = "eu-west-1"
    bucket         = "mss-sp-sec-terraform-state-gcsec-prod"
    dynamodb_table = "mss-sp-sec-terraform-state-lock"
    key            = "vsphere/rna-compute/planolabs.tfstate"
  }
}
