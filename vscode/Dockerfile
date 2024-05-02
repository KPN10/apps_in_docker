FROM ubuntu:22.04
ARG UID
ARG GID
RUN echo "Acquire::http::proxy \"http://192.168.1.1:3128\";\n Acquire::https::proxy \"http://192.168.1.1:3128\";" \
    >> /etc/apt/apt.conf.d/proxy && \
    apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    sudo \
    git \
    libasound2 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libexpat1 \
    libfontconfig1 \
    libfreetype6 \
    libgtk2.0-0 \
    libpango-1.0-0 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    libxshmfence-dev\
    openssh-client \
    wget \
    gpg \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
RUN addgroup -gid $GID nonroot && \
    echo 'developer ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    useradd -m --uid $UID --gid $GID -s /bin/bash developer && \
    usermod -aG sudo developer
USER developer
WORKDIR /home/developer
ENV http_proxy="192.168.1.1:3128"
ENV https_proxy="192.168.1.1:3128"
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && \
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] \
    https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' && \
    rm -f packages.microsoft.gpg && \
    sudo apt install apt-transport-https -y && \
    sudo apt update && \
    sudo apt install code -y
RUN mkdir ~/codedata && \
    chmod -R 777 ~/codedata
ENV http_proxy="http://192.168.1.1:3128"
ENV https_proxy="http://192.168.1.1:3128"
RUN /usr/bin/code --install-extension twxs.cmake
RUN /usr/bin/code --install-extension ms-vscode-remote.remote-containers
RUN /usr/bin/code --install-extension ms-python.python
RUN /usr/bin/code --install-extension ms-vscode.cpptools
RUN /usr/bin/code --install-extension ms-vscode.cpptools-themes
RUN /usr/bin/code --install-extension ms-vscode.cpptools-extension-pack
RUN /usr/bin/code --install-extension ms-dotnettools.csharp
RUN /usr/bin/code --install-extension ms-vscode-remote.remote-ssh
RUN /usr/bin/code --install-extension ms-vscode.makefile-tools
RUN /usr/bin/code --install-extension ms-vscode.hexeditor
RUN /usr/bin/code --install-extension ms-vscode.cmake-tools
RUN /usr/bin/code --install-extension ms-azuretools.vscode-docker
RUN /usr/bin/code --install-extension redhat.vscode-yaml
RUN /usr/bin/code --install-extension redhat.vscode-xml
RUN /usr/bin/code --install-extension xabikos.JavaScriptSnippets
RUN /usr/bin/code --install-extension PKief.material-icon-theme
RUN /usr/bin/code --install-extension vscodevim.vim && /usr/bin/code --disable-extension vscodevim.vim
RUN /usr/bin/code --install-extension mhutchie.git-graph
RUN /usr/bin/code --install-extension mshr-h.VerilogHDL
RUN /usr/bin/code --install-extension gvekony.systemverilog-1800-2012
RUN /usr/bin/code --install-extension bitwisecook.tcl
RUN /usr/bin/code --install-extension s3gf4ult.monokai-vibrant

RUN sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg |\
    sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#echo "deb [arch=$(dpkg --print-architecture)\
#    signed-by=/usr/share/keyrings/docker-archive-keyring.gpg]\
#    https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" |\
#    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN echo "deb [arch=$(dpkg --print-architecture)\
    signed-by=/usr/share/keyrings/docker-archive-keyring.gpg]\
    https://download.docker.com/linux/ubuntu jammy stable" |\
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN sudo apt update
RUN sudo apt install docker-ce -y
RUN sudo usermod -aG docker developer

CMD [ "/usr/bin/code","--verbose", "--user-data-dir=/home/developer/codedata" ]
