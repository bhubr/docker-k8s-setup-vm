# One-pod deployment

## Create pod

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

Start it: `kubectl apply -f k8s-one-pod.yaml`

## Create service

Example from [k8s Doc / Connecting Applications with Services](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/)

:warning: This below is a **deployment**:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-nginx
spec:
  selector:
    matchLabels:
      run: my-nginx
  replicas: 2
  template:
    metadata:
      labels:
        run: my-nginx
    spec:
      containers:
      - name: my-nginx
        image: nginx
        ports:
        - containerPort: 80
```

Tweak it since we already have a pod:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-hello
spec:
  selector:
    matchLabels:
      run: node-hello
  replicas: 2
```