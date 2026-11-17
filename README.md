# DSC180A Methodology Assignment 5

Environments and containerization: custom Docker image for DSMLP / GHCR.

## Image

```text
ghcr.io/jaerinx/dsc180a-ma5-docker-image
```

## What's installed

| Method   | Packages                          |
|----------|-----------------------------------|
| `apt-get`| `aria2`, `nmap`, `traceroute`     |
| `pip`    | `geopandas`, `babypandas==0.1.5`  |

Base image: `ghcr.io/ucsd-ets/datascience-notebook:2023.4-notebook7`

## Build locally

Requires [Docker Desktop](https://www.docker.com/products/docker-desktop/).

```bash
docker build -t dsc180a-ma5-docker-image .
```

## Test locally

```bash
docker run --rm -it dsc180a-ma5-docker-image
```

Inside the container:

```bash
which aria2c
which nmap
which traceroute
python -c "import geopandas, babypandas; print('ok')"
```

## Push to GHCR

```bash
# create a classic PAT with write:packages, delete:packages, read:packages
export CR_PAT=<your_token>
echo $CR_PAT | docker login ghcr.io -u jaerinx --password-stdin

docker tag dsc180a-ma5-docker-image ghcr.io/jaerinx/dsc180a-ma5-docker-image
docker push ghcr.io/jaerinx/dsc180a-ma5-docker-image
```

After pushing, make the package **public** under GitHub → Packages → Package settings.

## Use on DSMLP

```bash
launch.sh -i ghcr.io/jaerinx/dsc180a-ma5-docker-image -W DSC180A_FA26_001
```

## Gradescope submission

Submit (no tag):

```text
ghcr.io/jaerinx/dsc180a-ma5-docker-image
```
