# image has golang, git, make.
# image is based on debian
FROM golang:1.16

# TODO: too many layers (RUN commands) to install Docker. Use just one RUN
# command and one layer and remove all unnecessary content / cache :) to
# keep the image lean! :)

# install docker. why? for having docker client for debugging purposes, also
# because our checking scripts verify docker with docker CLI client
RUN apt update

RUN apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
            $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list

RUN apt update

RUN apt install -y docker-ce docker-ce-cli containerd.io

WORKDIR /workdir

COPY entrypoint.sh entrypoint.sh

RUN apt install -y zip

ENTRYPOINT /workdir/entrypoint.sh
