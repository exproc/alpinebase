FROM scratch
 RUN apk add --no-cache \
    alpine-release \
    bash \
    ca-certificates \
    coreutils \
    curl \
    jq \
    netcat-openbsd \
    procps-ng \
    shadow \
    tzdata \
    tzdata && \
  echo "**** create abc user and make our folders ****" && \
  useradd -u 6000 -U -d /config -s /bin/false abc