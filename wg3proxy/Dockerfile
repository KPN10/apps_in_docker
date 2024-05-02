FROM bookworm:latest

RUN apt update
RUN apt install wireguard openresolv -y && \
    echo "wireguard" >> /etc/modules

ARG THREEPROXY_VERSION=0.9.3
RUN apt install \
    gcc git make libc6-dev iptables -y

RUN git clone -b $THREEPROXY_VERSION https://github.com/z3APA3A/3proxy /tmp/3proxy && \
    make -j4 -C /tmp/3proxy -f Makefile.Linux && \
    mv /tmp/3proxy/bin/3proxy /usr/bin

RUN groupadd -g 666 3proxy && \
    useradd -u 666 -g 666 3proxy && \
    mkdir /etc/3proxy/ && \
    mkdir -m 700 -p /var/log/3proxy

RUN apt -y purge \
       gcc \
       git \
       make \
    && \
    rm -rf /tmp/3proxy

#CMD ["/bin/bash"]
CMD ["wg-quick", "up", "wg0"]
CMD ["sleep 2"]
CMD ["chown", "root:3proxy", "/etc/3proxy/3proxy.cfg"]
CMD ["chmod", "640", "/etc/3proxy/3proxy.cfg"]
CMD ["chown", "3proxy:3proxy", "/var/log/3proxy"]
CMD ["/usr/bin/3proxy", "/etc/3proxy/3proxy.cfg"]

