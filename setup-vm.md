# Setup VM Debian 11 pour Docker et Kubernetes

## Procedure post-install

### MAJ

En tant que `root` :

```
apt-get update
```

### Install de sudo

```
apt-get install -y sudo
```

### Install de Git (pour recuperer cette doc)

```
apt-get install -y git
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