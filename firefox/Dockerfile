FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Acquire::http::proxy \"http://192.168.1.1:3128\";" >> /etc/apt/apt.conf.d/proxy && \
    apt update && apt install -y firefox

ENV DISPLAY=:0

CMD ["firefox"]

