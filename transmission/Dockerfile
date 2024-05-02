FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install transmission-daemon -y
RUN dir="/var/lib/transmission-daemon" && \
    config_file="$dir/info/settings.json" && \
    mkdir $dir/torrents && \
    /bin/echo -e '{\n    "blocklist-enabled": 0,' >$config_file && \
    echo '    "dht-enabled": true,' >>$config_file && \
    echo '    "download-dir": "'"$dir"'/downloads",' >>$config_file && \
    echo '    "watch-dir-enabled": true,' >>$config_file && \
    echo '    "watch-dir": "'"$dir"'/torrents",' >>$config_file && \
    echo '    "download-limit": 100,' >>$config_file && \
    echo '    "download-limit-enabled": 0,' >>$config_file && \
    echo '    "encryption": 1,' >>$config_file && \
    echo '    "max-peer-global": 200,' >>$config_file && \
    echo '    "peer-port": 51413,' >>$config_file && \
    echo '    "peer-socket-tos": "lowcost",' >>$config_file && \
    echo '    "pex-enabled": 1,' >>$config_file && \
    echo '    "port-forwarding-enabled": 0,' >>$config_file && \
    echo '    "queue-stalled-enabled": true,' >>$config_file && \
    echo '    "ratio-limit-enabled": true,' >>$config_file && \
    echo '    "rpc-authentication-required": 1,' >>$config_file && \
    echo '    "rpc-password": "transmission",' >>$config_file && \
    echo '    "rpc-port": 9091,' >>$config_file && \
    echo '    "rpc-username": "transmission",' >>$config_file && \
    echo '    "rpc-whitelist-enabled": true,' >>$config_file && \
    echo '    "rpc-whitelist": "127.0.0.1,192.168.1.*",' >>$config_file && \
    echo '    "upload-limit": 100,' >>$config_file && \
    /bin/echo -e '    "upload-limit-enabled": 0\n}' >>$config_file

EXPOSE 9091 51413/tcp 51413/udp
USER debian-transmission
#CMD ["service transmission-daemon start"]
CMD ["sleep", "infinity"]

