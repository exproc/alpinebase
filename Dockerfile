 FROM alpine
 RUN apk add --no-cache \
    supervisor \
    bash \
    ca-certificates \
    coreutils \
    curl \
    jq \
    netcat-openbsd \
    procps-ng \
    shadow \
    nano \
    tzdata && \
    echo "**** create abc user and make our folders ****" && \
    useradd -u 6000 -U -d /config -s /bin/false abc && \
    mkdir -p \
    /tftpboot \
    /scripts \
    /config \
    /defaults && \
    echo "**** cleanup ****" && \
    rm -rf \
    /tmp/*
    RUN mkdir /etc/supervisor.d \
    chmod +x /scripts/start.sh
    # add local files
     ADD root/ /

   ENTRYPOINT [ "sh" , "/scripts/start.sh" ]