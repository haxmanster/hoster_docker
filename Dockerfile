FROM ubuntu:latest
MAINTAINER Grzegorz-wolyniec
LABEL version="1.1" location="Poland" type="Ubuntu-Virtual-Docker"
RUN apt-get update -y
RUN apt-get install -y nano \
                       openssh* \
                       vim \
                       mc \
                       apache2\
                       lsof \
                       sudo \
                       tmux \
                       git \
                       iproute2 \
                       fonts-powerline \
                       htop \
                       curl \
		       ncdu
RUN service ssh start
EXPOSE 22
EXPOSE 80
VOLUME ["/data"]
COPY . /data
COPY bashrc /home/user/.bashrc
COPY bash_profile /home/user/.bash_profile
COPY pureline /home/user/pureline/pureline
COPY powerline_full_256col.conf /home/user/.pureline.conf
RUN chmod +x /data/red.sh
WORKDIR /root
USER root
ENTRYPOINT //data/red.sh && /bin/bash
