provider kubernetes {
  load_config_file = true
  config_path      = "~/.kube/rna-seq.config"
}

provider helm {
  kubernetes {
    load_config_file = true
    config_path      = "~/.kube/rna-seq.config"
  }
}

terraform {
  backend "s3" {
    region         = "eu-west-1"
    bucket         = "mss-sp-sec-terraform-state-gcsec-prod"
    dynamodb_table = "mss-sp-sec-terraform-state-lock"
    key            = "vsphere/rna-compute/kubernetes.tfstate"
  }
}
