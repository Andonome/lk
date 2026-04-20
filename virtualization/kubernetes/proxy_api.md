---
title: Proxy API
tags: 
- virtualization
- kubernetes
requires: 
- minikube_setup
---

Start the proxy:

```sh
kubectl proxy &
```

Then curl the API server:


```sh
curl http://localhost:8001
```

Create a token:

```sh
export TOKEN=$(kubectl create token default)

kubectl create clusterrole api-access-root \
  --verb=get --non-resource-url=/*

kubectl create clusterrolebinding api-access-root \
  --clusterrole api-access-root --serviceaccount=default:default

```

Retrieve the API Server endpoint:

```sh
export APISERVER=$(kubectl config view | grep https | \
  cut -f 2- -d ":" | tr -d " ")
```

Confirm that the `APISERVER` variable stored the same IP as the Kubernetes control plane IP by issuing the following two commands and comparing their outputs:

```sh
echo $APISERVER

https://192.168.99.100:8443

kubectl cluster-info

```

We can also get the certs straight from the list in `~/.kube/config`.


