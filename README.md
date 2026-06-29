# hpc-slinky-mvp

Research and MVP platform for Slinky (Slurm + Kubernetes) on AWS.

## Goal

Build a clean AWS-based MVP for Slinky slurm-operator.

## Phase 1

- Prepare base OS
- Install Kubernetes
- Install Helm
- Install cert-manager
- Install slurm-operator
- Deploy Slurm cluster inside Kubernetes
- Validate sinfo, srun, sbatch

## Architecture

- Existing Ansible server
- build01
- k8sctl01
- k8sworker01-03
- storage01
- login01
