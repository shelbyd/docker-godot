FROM ubuntu:xenial

ENV GODOT_VERSION "3.1.1"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    unzip \
    python \
    python-openssl \
    git \
    ssh-client \
    curl \
    libarchive13 \
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
    && curl -L -O https://github.com/git-lfs/git-lfs/releases/download/v2.4.0/git-lfs-linux-amd64-2.4.0.tar.gz \
    && ls \
    && cd /tmp \
    && tar xvzf git-lfs-linux-amd64-2.4.0.tar.gz \
    && cd git-lfs-2.4.0 \
    && ./install.sh \
    && git lfs install \
    && rm -rf /tmp/git-lfs*

RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip \
    && wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_export_templates.tpz \
    && mkdir ~/.cache \
    && mkdir -p ~/.config/godot \
    && mkdir -p ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && unzip Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip \
    && mv Godot_v${GODOT_VERSION}-stable_linux_headless.64 /usr/local/bin/godot \
    && unzip Godot_v${GODOT_VERSION}-stable_export_templates.tpz \
    && mv templates/* ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && rm -f Godot_v${GODOT_VERSION}-stable_export_templates.tpz Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip
