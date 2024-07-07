FROM ubuntu:22.04
ARG UID
ARG GID
RUN echo "Acquire::http::proxy \"http://192.168.1.1:3128\";\n Acquire::https::proxy \"http://192.168.1.1:3128\";" \
    >> /etc/apt/apt.conf.d/proxy && \
    apt update && apt upgrade -y -f
#RUN apt update && apt upgrade -y
RUN apt install sudo unzip libc6-i386 openjdk-8-jre libgtk-3-0 libgdm-dev chromium-browser libgcrypt-dev \
    libswt-gtk-4-jni libswt-gtk-4-java dbus-x11 libsm6 libncurses5 libnss3 libdrm2 libgbm1 libudev1 libx11-xcb1 \
    libxcb-render-util0 libxcb-randr0 libxcb-shape0 libxcb-xfixes0 libxcb-sync1 libxcb-icccm4 libxcb-keysyms1 libxcb-image0 \
    libxcb-util1 libxcb-xkb1 libxkbcommon-x11-0 libkmod2 libgl1-mesa-glx libusb-1.0-0-dev -y -f
RUN addgroup -gid $GID nonroot && \
    echo 'developer ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    useradd -m --uid $UID --gid $GID -s /bin/bash developer && \
    usermod -aG sudo developer
USER developer
ADD en.stm32cubeprg-lin-v2-16-0.zip /tmp/en.stm32cubeprg-lin-v2-16-0.zip
ADD auto_install.xml /tmp/auto_install.xml
WORKDIR /tmp
RUN unzip en.stm32cubeprg-lin-v2-16-0.zip
# NOTE: manual install gui and commit image
#    /tmp/SetupSTM32CubeProgrammer-2.16.0.linux auto_install.xml
WORKDIR /home/developer

