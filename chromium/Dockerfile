FROM debian:latest

ENV http_proxy http://192.168.1.1:3128
ENV https_proxy http://192.168.1.1:3128

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y chromium

ENV DISPLAY=:0

CMD ["/bin/bash"]
#CMD ["chromium", " --no-sandbox", "--disable-gpu-sandbox", "--proxy-server=http://192.168.1.1:56120"]
