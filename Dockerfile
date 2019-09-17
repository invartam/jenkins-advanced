FROM jenkins/jenkins

ENV docker_ver=18.03.0
ENV ansible_ver=2.5

USER root:root

RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-${docker_ver}-ce.tgz \
    && tar -xvf docker-${docker_ver}-ce.tgz \
    && mv docker/docker /usr/bin/docker \
    && rm -rf docker

RUN apt update \
    && apt-get install -y software-properties-common ca-certificates apt-transport-https

RUN add-apt-repository "deb http://ppa.launchpad.net/ansible/ansible-${ansible_ver}/ubuntu/ xenial main" \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
    && wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get install -y ansible sshpass python-docker php5.6 php5.6-mysql mysql-utilities \
    && apt-get clean
