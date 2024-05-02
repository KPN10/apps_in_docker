FROM ubuntu:latest
ARG THREEPROXY_VERSION=0.9.3

RUN apt-get update && apt-get -y dist-upgrade  && \
    apt-get -y --no-install-recommends install \
        gcc \
        git \
        make \
        libc6-dev \
        ca-certificates \
	iptables 
COPY 3proxy.cfg /etc
RUN git clone -b $THREEPROXY_VERSION https://github.com/z3APA3A/3proxy /tmp/3proxy && \
    make -j4 -C /tmp/3proxy -f Makefile.Linux && \
    mv /tmp/3proxy/bin/3proxy /usr/bin && \
    groupadd -g 666 3proxy && \
    useradd -u 666 -g 666 3proxy && \
    chown root:3proxy /etc/3proxy.cfg && \
    chmod 640 /etc/3proxy.cfg && \
    mkdir -m 700 -p /var/log/3proxy && \
    chown 3proxy:3proxy /var/log/3proxy

#RUN apt-get -y purge \
#        gcc \
#        git \
#        make \
#        libc6-dev \
#        ca-certificates \
#    && \
#    rm -rf /tmp/3proxy && \
#    apt-get -y clean && \
#    apt-get -y autoremove --purge

#CMD ["/bin/bash"]
CMD ["/usr/bin/3proxy", "/etc/3proxy.cfg"]
