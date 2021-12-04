# Setup Minikube

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