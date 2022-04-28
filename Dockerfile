FROM debian:stable-slim

RUN  \
    sed -i"" 's,http://httpredir.debian.org/debian,https://ftp.us.debian.org/debian/,' /etc/apt/sources.list && \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python-pip \
    build-essential \
    libguestfs-tools \
    libncurses5-dev \
    tree \
    debootstrap \
    kpartx \
    lvm2 \
    dosfstools \
    zip \
    unzip \
    pigz \
    awscli \
    ruby \
    ruby-dev \
    shellcheck \
    --no-install-recommends && \
    sed -i 's,https://ftp.us.debian.org/debian/,https://deb.debian.org/debian,' /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/*

RUN gem update --system && \
    gem install --no-document serverspec && \
    gem install --no-document pry-byebug && \
    gem install --no-document bundler
