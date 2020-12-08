## Terraform execution

- Minimum terraform version: 0.13.5

## vSphere deployment
Create a machine template for centos 8.3 or greater:
  - minimal server install
  - guest os tools
  - cloud-init scripts
  - add public keys to centos user
  - allow passwordless sudo for centos user

Create a new `datacenter.tfvars` file in the `terraform/vsphere` folder with the following contents

```
vsphere_server = "<YOUR VSPHERE SERVER>"

domain      = "<DNS_DOMAIN>"
dns_servers = [
  "<DNS SERVER 1>",
  "<DNS SERVER 2>",
]

template_path = "<PATH/TO/YOUR_TEMPLATE_IMAGE>"

datacenter       = "<DATACENTER>"
cluster          = "<CLUSTER_NAME>"
datastorecluster = "<DATASTORE>"

vapps = {
  "sequencer" = {
    network   = "<VSPHERE_NETWORK_NAME>"
    subnet    = SUBNET_SIZE (16|24|27|etc...)

    # Addresses are examples only
    # change these to match your network
    gateway   = "127.0.0.1"
    filestore = "127.0.0.2"
    master = {
      "seq-master-1" = "127.0.0.3"
    }
    nodes = {
      "seq-worker-1" = "127.0.0.4",
      "seq-worker-2" = "127.0.0.5",
      "seq-worker-3" = "127.0.0.5",
      "seq-worker-4" = "127.0.0.6"
    }
  }
}
```
