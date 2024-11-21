FROM ubuntu:20.04
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    jq \
    ca-certificates \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && \
    install -m 555 argocd-linux-amd64 /usr/local/bin/argocd && \
    rm argocd-linux-amd64
CMD ["/bin/bash"]