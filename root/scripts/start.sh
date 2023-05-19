#!/bin/sh
PUID=${PUID:-6000}
PGID=${PGID:-6000}

groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc

#echo '
#───────────────────────────────────────
#GID/UID
#───────────────────────────────────────'
#echo "
#User UID:    $(id -u abc)
#User GID:    $(id -g abc)
#───────────────────────────────────────
#"

supervisord -c  /etc/supervisord.conf
exec "$@"
