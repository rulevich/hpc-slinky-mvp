# HPC Platform Architecture

## Vision

Build a modern HPC platform that combines:

- Slurm
- Kubernetes
- Slinky
- Infrastructure as Code
- Ansible
- GitOps principles
- Cloud deployment (AWS)
- Physical cluster deployment

The same codebase should support both AWS labs and future production hardware.

---

# Platform Layers

Infrastructure
    │
    ▼
Terraform

    │
    ▼
Operating System
(Base Role)

    │
    ▼
Repositories

    │
    ▼
Container Runtime
(containerd)

    │
    ▼
Kubernetes

    │
    ▼
Platform Services

- Helm
- Metrics Server
- Ingress
- Cert Manager

    │
    ▼
HPC Layer

- Slinky
- Slurm Operator
- Slurm Bridge

    │
    ▼
Applications

- Open OnDemand
- Jupyter
- VSCode
- AI Services

---

# Repository Structure

ansible/
terraform/
kubernetes/
docs/
scripts/

---

# Ansible Roles

base

Operating system configuration.

repositories

Configure external repositories.

containerd

Install and configure container runtime.

kube-packages

Install kubeadm, kubelet and kubectl.

kube-bootstrap

Create Kubernetes cluster.

helm

Install Helm.

slurm-operator

Deploy Slinky.

monitoring

Install monitoring stack.

storage

Configure storage services.

build

Build server configuration.

---

# Playbook Order

00-base.yml

05-repositories.yml

10-containerd.yml

20-kube-packages.yml

30-kube-bootstrap.yml

40-helm.yml

50-slurm-operator.yml

90-validate.yml

99-reboot.yml

---

# Design Principles

Every Role has a single responsibility.

Every Role validates itself.

No manual configuration.

Infrastructure is reproducible.

Everything is stored in Git.

Every change is applied through Ansible.

---

# Target Environment

Build Server

Ansible

Terraform

Git

AWS CLI

kubectl

helm

Future:

k9s

crictl

stern

