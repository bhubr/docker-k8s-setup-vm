!#/bin/bash
wget https://storage.googleapis.com/kubernetes-release/release/v1.21.2/bin/linux/amd64/kubectl
chmod +x kubectl
wget https://github.com/kubernetes/minikube/releases/download/v1.22.0/minikube_1.22.0-0_amd64.deb
# wget https://github.com/kubernetes/minikube/releases/download/v1.22.0/minikube-1.22.0-0.x86_64.rpm
# wget https://github.com/kubernetes/minikube/releases/download/v1.22.0/minikube-linux-amd64
# wget https://github.com/kubernetes/minikube/releases/download/v1.22.0/minikube-linux-amd64.tar.gz
# wget https://github.com/kubernetes/minikube/releases/download/v1.22.0/minikube-linux-amd64.sha256

# Apres DL
# dpkg -i minikube_1.22.0-0_amd64.deb
# PAS EN ROOT
# minikube start