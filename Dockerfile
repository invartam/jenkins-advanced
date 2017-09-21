FROM jenkins/jenkins

ENV docker_ver=17.06.2

USER root:root

RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-${docker_ver}-ce.tgz \
    && tar -xvf docker-${docker_ver}-ce.tgz \
    && mv docker/docker /usr/bin/docker \
    && rm -rf docker

RUN apt update \
    && apt install -y ansible \
    && apt clean

RUN apt install -y sshpass \
    && apt clean

