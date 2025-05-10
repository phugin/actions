FROM ubuntu:16.04

ARG LC_ALL=C DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt-get update -q && \
    apt-get install -y --no-install-recommends \
        locales sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# Change language
RUN locale-gen en_US.UTF-8

# Common tools
RUN apt-get update -q && \
    apt-get install -y --no-install-recommends \
        curl wget vim git net-tools iputils-ping bzip2 xz-utils unzip file \
        git patch && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ( set -ex \
    && git config --system safe.directory   "*" \
    && git config --system core.autocrlf    "input" \
    && git config --system core.editor      "vim" \
    && git config --system core.filemode    "false" \
    )

# Build tools
RUN apt-get update -q && \
    apt-get install -y --no-install-recommends \
        gcc g++ cmake make cpio rsync \
         libncurses5-dev libncursesw5-dev \
         mtd-utils flex bison bc u-boot-tools libssl-dev zlib1g-dev libsdl1.2-dev gettext texinfo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]