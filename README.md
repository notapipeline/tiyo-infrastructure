# RNA Sequence cluster manager
This repository will set up a Kubernetes cluster for executing an RNA Sequence pipeline, then load the data and
execute the pipeline according to the structure provided.

## Cluster components:

- Kubernetes master
- n\*Kubernetes nodes
- Persistant storage

## Cluster applications

- Kubernetes dashboard
- Metrics server
- Redis store for queue management
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

