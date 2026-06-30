# Containerd Role

This role installs and configures the container runtime used by Kubernetes.

Responsibilities:

- Install containerd
- Load required kernel modules
- Configure sysctl parameters for Kubernetes
- Generate containerd configuration
- Enable SystemdCgroup
- Start and enable containerd
- Validate the installation
