#!/bin/bash
docker stop tron ; docker rm tron; \
docker build -t ssh_docker . ; \
docker run -t --name tron -d -p 82:80 -p 223:22 -h TRON ssh_docker ; \

