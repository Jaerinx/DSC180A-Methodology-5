# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/datascience-notebook:2023.4-notebook7

FROM $BASE_CONTAINER

LABEL maintainer="Hieu <hieun201104@gmail.com>"

# 2) change to root to install packages
USER root

# apt package lists may be missing in the base image
RUN apt-get update && \
    apt-get -y install aria2 nmap traceroute && \
    rm -rf /var/lib/apt/lists/*

# 3) install packages using notebook user
USER jovyan

RUN pip install --no-cache-dir geopandas babypandas==0.1.5

# Override command to disable running jupyter notebook at launch
CMD ["/bin/bash"]
