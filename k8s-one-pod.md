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
    image: ghcr.io/bhubr/node-hello-world:0.0.2
    ports:
    - containerPort: 3000
```

Start it: `kubectl apply -f k8s-one-pod.yaml`

```
NAME                          READY   STATUS    RESTARTS   AGE
node-hello                    1/1     Running   1          11m
```

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

Tweak it ~~since we already have a pod~~ just change a few things but **keep** the template (which I removed at first):

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
  template:
    metadata:
      labels:
        run: node-hello
    spec:
      containers:
      - name: node-hello
        image: ghcr.io/bhubr/node-hello-world:0.0.2
        ports:
        - containerPort: 3000
```

Apply it: `kubectl apply -f k8s-one-pod-depl.yaml`.

There was *one* pod named `node-hello` before running it, and now? An error because we removed the template.

Btw there was an error in my files! Didn't change port from 80 to 3000.

After adding template to deployment and applying we have **three** pods running: one from the single pod file, two from the deployment.

```
NAME                          READY   STATUS    RESTARTS   AGE
node-hello                    1/1     Running   1          11m
node-hello-59786f649b-95cgw   1/1     Running   1          11m
node-hello-59786f649b-vcg87   1/1     Running   1          11m
```

(still 1.5 free Gb RAM, got some back when rebooted the VM).

**reboot VM in order to add Port FW to NAT interface**

* 3560 Mb before starting minikube
* 1793 Mb after, with 3 pods still running

## Add Ingress Controller

[k8s Doc / Set up Ingress on Minikube with the NGINX Ingress Controller](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)

```
minikube addons enable ingress
```

Result:

```
benoit@debian:~$ minikube addons enable ingress
    ▪ Using image k8s.gcr.io/ingress-nginx/controller:v0.44.0
    ▪ Using image docker.io/jettech/kube-webhook-certgen:v1.5.1
    ▪ Using image docker.io/jettech/kube-webhook-certgen:v1.5.1
🔎  Verifying ingress addon...
```

(after that: 1194.4 Mb free)

Verify that the Nginx Ingress Controller is running:

```
kubectl get pods -n ingress-nginx
```

Then

1. Skip the 1st step in "Deploy a hello, world app" section.
2. Expose the depl: ~~`kubectl expose deployment node-hello --type=NodePort --port=3333`~~. `kubectl expose deployment node-hello --type=NodePort --port=3000`. responds with `service/node-hello exposed`
3. Verify the Service is created and is available on a node port: `kubectl get service node-hello`

```
NAME         TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
node-hello   NodePort   10.103.255.162   <none>        3333:32147/TCP   3h49m
```

4. Visit the Service via NodePort: `minikube service node-hello --url`

```
http://192.168.49.2:32147
```

**DIDN'T WORK B/C node-hello bound to 127.0.0.1 instead of 0.0.0.0!!**