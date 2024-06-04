FROM debian:latest

ARG UID
ARG GID

ENV DEBIAN_FRONTEND=noninteractive
ENV USERNAME=chromium

RUN apt update && apt upgrade -y
RUN apt install -y sudo chromium
RUN addgroup -gid $GID nonroot
RUN useradd -m -s /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME

ENV DISPLAY=:0

#CMD ["/bin/bash"]
#CMD ["chromium", " --no-sandbox", "--disable-gpu", "--proxy-server=http://<ip>:<port>"]
CMD ["chromium", "--proxy-server=http://<ip>:<port>"]
