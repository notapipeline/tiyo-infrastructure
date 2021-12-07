# RNA Sequence cluster manager
This repository will set up a Kubernetes cluster for executing an RNA Sequence pipeline, then load the data and
execute the pipeline according to the structure provided.

## Ansible VMWARE
export VMWARE\_PROXY\_HOST=
export VMWARE\_PROXY\_PORT=
export VMWARE\_HOST=
export VMWARE\_USERNAME=
export VMWARE\_PASSWORD=

## Ansible SSH
export SSH\_COMPARTMENT\_KEY
export SSH\_COMPARTMENT\_USER

## Cluster components:

- Kubernetes master
- n\*Kubernetes nodes
- Persistant storage

## Cluster applications

- Kubernetes dashboard
- Metrics server
- InfluxDB for monitoring
- Processing deployments
  - fastqc
  - star
  - htseq
- Sidecar deployments
  - Sequence-scheduler
  - Telegraf

Build order:
- Terraform base layer (vsphere)
  - filestore
  - master
  - nodes
- Ansible kubernetes build
  - Master
  - Nodes
- Terraform helm deploy
  - Metrics
  - Dashboard
  - InfluxDB2
  - Redis
  - FastQC, STAR, HTSeq
- Queue population
  - Download file
  - write redis data
  - init queue

