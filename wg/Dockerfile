FROM bookworm:latest

RUN apt update
RUN apt install wireguard openresolv iptables -y && \
    echo "wireguard" >> /etc/modules
COPY wg0.conf /etc/wireguard

CMD ["sleep", "infinity"]

