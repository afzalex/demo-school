#!/bin/sh

if [ -f "/tmp/init-data-directory.tar.gz" ] && [ ! -f /data/movedflag ]; then
    echo "Initial directory and flag found. Moving it to data directory"
    cd /tmp
    tar -xzvf init-data-directory.tar.gz
    mv /tmp/gitea/* /data
    rm -rf /data/initflag
    touch /data/movedflag
fi

exec /usr/bin/entrypoint "$@"
