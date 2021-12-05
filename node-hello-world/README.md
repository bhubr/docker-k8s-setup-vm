# Node Hello World

From [Node.js / About](https://nodejs.org/en/about/)

* Build the image: `docker build -t ghcr.io/bhubr/node-hello-world:0.0.1 .`
* Run it: `docker run ghcr.io/bhubr/node-hello-world:0.0.1`
* Login to GHCR: `export CR_PAT=Token;echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin`
* Push it: `docker push ghcr.io/bhubr/node-hello-world:0.0.1`
* Change its visibility to public in [package settings](https://github.com/users/bhubr/packages/container/node-hello-world/settings)

After changing `hostname` value in `hello-world.js`:

* `docker run ghcr.io/bhubr/node-hello-world:0.0.2`
* `docker push ghcr.io/bhubr/node-hello-world:0.0.2`
