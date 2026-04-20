---
title: "Kubernetes Setup"
tags: [ "virtualization", "kubernetes", "minikube", "docker" ]
---

# Install `minikube`
Set up a practice environment with `minikube`, using either Docker or VirtualBox.

1. Install the driver (VirtualBox is a good choice).
1. Install `minikube`.
    * Debian requires manual installation.[^minideb]
1. Check it works.

The installation takes a long time.

```sh
#  driver=docker
driver=virtualbox
minikube start --driver=${driver}
```

## Check `minikube`

Check it's all running:

```sh
minikube kubectl -- get po -A
```

```
NAMESPACE     NAME                               READY   STATUS    RESTARTS      AGE
kube-system   coredns-674b8bbfcf-l7582           1/1     Running   0             2m
kube-system   etcd-minikube                      1/1     Running   0             2m
kube-system   kube-apiserver-minikube            1/1     Running   0             2m
kube-system   kube-controller-manager-minikube   1/1     Running   0             2m
kube-system   kube-proxy-4q977                   1/1     Running   0             2m
kube-system   kube-scheduler-minikube            1/1     Running   0             2m
kube-system   storage-provisioner                1/1     Running   1 (2m ago)    2m
```

# Uninstall `minikube`

```sh
du -sh ~/.minikube
```

Minikube is huge!

```sh
minikube stop
rm -rf ~/.minikube
```

[^minideb]: https://minikube.sigs.k8s.io/docs/start/
