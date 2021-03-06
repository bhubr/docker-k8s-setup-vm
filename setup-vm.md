# Setup VM Debian 11 pour Docker et Kubernetes

## Parametrage VM pre-install

* **ATTENTION** mettre 2 cores sinon minikube en PLS (peut etre fait apres coup)
* Ajouter redirection de port sur interface NAT

## Procedure post-install

### MAJ

En tant que `root` :

```
apt-get update
```

### Install de sudo, vim, git

```
apt-get install -y sudo vim git
```

### Octroi des droits sudo

```
usermod -aG sudo benoit
```

### Installation de Docker

Doc d'[installation sur Debian](https://docs.docker.com/engine/install/debian/)

```
apt-get -y install ca-certificates curl gnupg lsb-release
```

Ajout cle GPG :

```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

Setup repo stable :

```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install Docker Engine

```
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
```