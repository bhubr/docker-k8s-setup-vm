# One-pod deployment

Example from [k8s Doc / Pods](https://kubernetes.io/docs/concepts/workloads/pods/) :

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```

Modify it so as to run a Node.js image (see `node-hello-world/README.md`)

```
apiVersion: v1
kind: Pod
metadata:
  name: node-hello
spec:
  containers:
  - name: node-hello
    image: ghcr.io/bhubr/node-hello-world:0.0.1
    ports:
    - containerPort: 80
```