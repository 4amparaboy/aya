FROM archlinux

ENV PIP_NO_CACHE_DIR 1

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN pacman -Syu --noconfirm \
    git \
    aria2 \
    python-lxml \
    curl \
    pv \
    jq \
    ffmpeg \
    python \
    p7zip \
    python-pip \
    openssl \
    wget \
    gcc \
    neofetch \
    && rm -rf /var/cache/pacman/pkg /tmp
    
COPY requirements.txt .
COPY extract /usr/local/bin
RUN chmod +x /usr/local/bin/extract
RUN python3 -m pip install -r requirements.txt
COPY . .
COPY netrc /root/.netrc
RUN chmod +x aria.sh

CMD ["bash","start.sh"]
