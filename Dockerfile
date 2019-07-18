FROM ubuntu:latest
MAINTAINER Grzegorz-wolyniec
LABEL version="1.0" location="Poland" type="Ubuntu-with-ssh"
RUN apt-get update -y
RUN apt-get install -y openssh* vim mc apache2 lsof sudo
RUN service ssh start
EXPOSE 22
EXPOSE 80
VOLUME ["/data"]
COPY . /data
RUN chmod +x /data/red.sh
WORKDIR /root
USER root
ENTRYPOINT //data/red.sh && /bin/bash
