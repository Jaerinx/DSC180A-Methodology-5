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

## Build and publish

This repo uses GitHub Actions (`.github/workflows/docker-publish.yml`) to build the
image and push it to GHCR on every push to `main`.

After the first successful workflow run, make the package **public**:

GitHub → profile → Packages → `dsc180a-ma5-docker-image` → Package settings → Change visibility → Public.

### Build locally (optional)

Requires [Docker Desktop](https://www.docker.com/products/docker-desktop/) with WSL2.

```bash
docker build -t dsc180a-ma5-docker-image .
docker run --rm -it dsc180a-ma5-docker-image
```

Inside the container:

```bash
which aria2c
which nmap
which traceroute
python -c "import geopandas, babypandas; print('ok')"
```

## Use on DSMLP

```bash
launch.sh -i ghcr.io/jaerinx/dsc180a-ma5-docker-image -W DSC180A_FA26_001
```

## Gradescope submission

Submit (no tag):

```text
ghcr.io/jaerinx/dsc180a-ma5-docker-image
```
