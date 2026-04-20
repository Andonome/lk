---
title: Kubernetes Basics
tags: 
- virtualization
- kubernetes
requires: 
- minikube_setup
---

Install `kubectl`.

> **NB:** Debian requires manual installation.[^kubedeb]

[^kubedeb]: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

# Read

1. Check the namespace: `kubectl get namespaces`
1. Check the `${kube-system}` namespace: `kubectl get deployments.apps --namespace kube-system'
1. Check host computers: `kubectl get nodes`
1. Check pods: `kubectl get pods`


```tree
Namespaces
├── Node_1: minikube
│   ├── deployment_1: nginx
│   │   ├── pod_1
│   │   └── pod_2
│   ├── deployment_2: database
│   │   ├── pod_1
│   │   ├── pod_2
│   │   ├── pod_3
│   │   └── pod_4
│   ├── deployment_3: prometheus
│   └── deployment_4: idk probably yaml
└── Node_1: physical server
    ├── deployment_1: nginx
    │   ├── pod_1
    │   └── pod_2
    ├── deployment_2: database
    │   ├── pod_1
    │   ├── pod_2
    │   ├── pod_3
    │   └── pod_4
    ├── deployment_3: prometheus
    └── deployment_4: Abandoned wiki
```

## More Information

```bash
    $ kubectl get pod

NAME                          READY   STATUS    RESTARTS   AGE
nginx-depl-68c944fcbc-2xbvq   1/1     Running   0          20m

    $ kubectl describe pod nginx-depl-68c944fcbc-2xbvq

Name:             nginx-depl-68c944fcbc-2xbvq
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/192.168.59.107
Start Time:       Fri, 29 Aug 2025 19:26:29 +0200
Labels:           app=nginx-depl
                  pod-template-hash=68c944fcbc
Annotations:      <none>
Status:           Running
IP:               10.244.0.3
IPs:
  IP:           10.244.0.3
Controlled By:  ReplicaSet/nginx-depl-68c944fcbc
Containers:
  nginx:
    Container ID:   docker://aaa68e90ed9237dc0f98f9a21b0d7ddf3113188c62e72242d30cab4a43cbff98
    Image:          nginx
    Image ID:       docker-pullable://nginx@sha256:33e0bbc7ca9ecf108140af6288c7c9d1ecc77548cbfd3952fd8466a75edefe57
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Fri, 29 Aug 2025 19:26:41 +0200
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-9bgxx (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-9bgxx:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  24m   default-scheduler  Successfully assigned default/nginx-depl-68c944fcbc-2xbvq to minikube
  Normal  Pulling    24m   kubelet            Pulling image "nginx"
  Normal  Pulled     24m   kubelet            Successfully pulled image "nginx" in 11.204s (11.204s including waiting). Image size: 192385800 bytes.
  Normal  Created    24m   kubelet            Created container: nginx
  Normal  Started    24m   kubelet            Started container nginx

```

Pod copies are called a 'replicaset'.


```bash
    $ kubectl exec $POD_NAME -- env

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=stupendously-verbose-podish-nomenclature-jvguenaqbz-punenpgref
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PROTO=tcp
NPM_CONFIG_LOGLEVEL=info
NODE_VERSION=6.3.1
HOME=/root
```

# Create

Create a 'deployment' of `nginx`.

```sh
name="nginx-depl"
kubectl create deployment ${name} --image=nginx
kubectl get deployments
```

The command did not specify a namespace, so `default` is used.

# Update

Update a deployment, with `$EDITOR`.

```sh
kubectl edit deployments.apps ${name}
```

This gives us far too much information:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"

    [ ... ]

  creationTimestamp: "2025-08-29T18:13:45Z"
  generation: 3
  labels:
    app: nginx-depl
  name: nginx-depl
  namespace: default
  resourceVersion: "17696"
  uid: 8dec2925-5c34-4635-b82c-ba601cb3bef5
spec:
  progressDeadlineSeconds: 600
  replicas: 2
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: nginx-depl

  [ ... ]

  observedGeneration: 3
  readyReplicas: 2
  replicas: 2
  updatedReplicas: 2
```

Pull out the information, without an `$EDITOR`:

```sh
file="webstuff"
kubectl get deployment ${name} -o yaml > ${webstuff}.yaml
```

## Enter the Pod

```bash
    $ kubectl get pods

NAME                          READY   STATUS    RESTARTS   AGE
nginx-depl-68c944fcbc-2xbvq   1/1     Running   0          31m

    $ pod='nginx-depl-68c944fcbc-2xbvq'  
    $ kubectl exec -it ${pod}  -- bash

    root@nginx-depl-68c944fcbc-2xbvq:/# ls
    bin   dev		   docker-entrypoint.sh  home  lib64  mnt  proc  run   srv  tmp  var
    boot  docker-entrypoint.d  etc			 lib   media  opt  root  sbin  sys  usr
    root@nginx-depl-68c944fcbc-2xbvq:/#
    exit
```

# Delete

Delete a deployment, and watch it leave:

```sh
name=nginx-depl
kubectl delete deployments.apps nginx-depl && kubectl get deployments.apps
kubectl get deployments.apps
```


