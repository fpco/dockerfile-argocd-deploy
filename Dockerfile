FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        wget \
        && \
    rm -rf /var/lib/apt/lists/*
RUN curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.15.12/bin/linux/amd64/kubectl && \
    chmod a+x /usr/local/bin/kubectl
RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.5.4/kustomize_v3.5.4_linux_amd64.tar.gz |tar xzf - -C /usr/local/bin
RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v1.5.4/argocd-linux-amd64 && \
    chmod +x /usr/local/bin/argocd

