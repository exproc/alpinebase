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
    RUN ls -la /scripts
    RUN mkdir /etc/supervisor.d 
    # add local files
    COPY root/scripts/start.sh / 
    ADD  root/ /
    RUN chmod +x /start.sh
    RUN ls -la /scripts && ls -la /etc
    RUN cat /etc/supervisord.conf
    ENTRYPOINT [ "start.sh" ] 
