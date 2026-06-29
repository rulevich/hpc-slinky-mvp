# hpc-slinky-mvp

AWS-based MVP for Slinky: Slurm on Kubernetes using slurm-operator.

## Structure

- terraform/ - AWS infrastructure
- ansible/ - OS and Kubernetes configuration
- kubernetes/ - Helm values and manifests
- docs/ - architecture and notes
- scripts/ - helper scripts

## First goal

Deploy a small Rocky Linux based Kubernetes cluster and install Slinky slurm-operator.
