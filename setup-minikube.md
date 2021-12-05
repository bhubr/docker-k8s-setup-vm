# Setup Minikube

**ATTENTION** mettre 2 cores sur la VM sinon minikube en PLS

* [Doc install minikube](https://minikube.sigs.k8s.io/docs/start/)
* Check la version du package debian : 1.24.0-0
* [Doc install kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/)

Dilemmes :

* Trouver des versions coherentes de minikube et kubectl ?

    * Release 1.22.0 de minikube : https://github.com/kubernetes/minikube/releases/download/v1.22.0/minikube-linux-amd64 (depuis https://github.com/kubernetes/minikube/releases/tag/v1.22.0)
    * Release 1.22.0 de kubectl : https://storage.googleapis.com/kubernetes-release/release/v1.22.0/bin/linux/amd64/kubectl
    * Voir [Version Skew Policy](https://kubernetes.io/releases/version-skew-policy/) : 1 version mineure de skew entre kubectl et kube-apiserver
* Versions coherentes avec versions supportees par les cloud providers

    * Amazon EKS &rarr; 1.21.2 (1.21 depuis avril 2021, 1.22 prevue pour ["early 2022"](https://github.com/aws/containers-roadmap/issues/1397#issuecomment-975723525)). pas de free trial pour EKS
    * GKE 1.22 [prevue early 2022 aussi](https://cloud.google.com/kubernetes-engine/docs/release-schedule). 300$ de credit
    * Azure AKS GA = Generally Available. 1.22 en novembre, 1.23 en decembre. 200$ de credit
    * IBM Cloud  1.21 depuis juin 2021. 200$ credit
* Item coherence avec versions supportees par Openshift -> Openshift 4.9 utilise Kubernetes 1.22 avec le runtime CRI-O. La 4.8 utilise 1.21.

**La 1.21 semble etre un choix safe**.

**ATTENTION** c'est la [v1.22.0 de minikube](https://github.com/kubernetes/minikube/releases/tag/v1.22.0) qui set la version de k8s a 1.21.2 par defaut !!

* Il y a des .deb et des .rpm en plus du binaire
* UTILISER wget pour dl les binaires ! curl patauge avec les liens GitHub

## Droits

* Ajouter utilisateur regulier aux sudoers -> deja fait en post install VM
* Ajouter utilisateur regulier au groupe `docker` : `sudo usermod -aG docker benoit`
* newgrp - se connecter avec un nouveau groupe : `newgrp docker`

## Pendant `minikube start` 

`minikube start` download son propre kubectl ? non en fait... installe `preloaded-images-k8s-v11-v...` et `gcr.io/k8s-minikube/kicbase...`.

Ca prend du temps sur "Downloading Kubernetes v1.21.2 preload ...".

Puis reste sur "Creating docker container (CPUs=2, Memory=2200MB) d'ou l'importance de mettre assez de RAM !mini"

Ca fonctionne. Au final le minikube downloade depuis GitHub et le minikube kubectl donnent la meme version, jusqu'au SHA de commit Git.

kubectl is now configured to use "minikube" cluster and "default" namespace by default

`top` indique 2829.3 avail Mem, 134.1 free
vs VM source  3691.2 avail Mem, 3597.8 free
