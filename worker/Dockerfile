FROM ubuntu:latest
RUN touch /etc/apt/sources.list.d/imtplay.list
RUN apt-get update
#RUN apt-get -y --fix-missing update
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime 
RUN apt-get -y install python3-pip python3-dev python3-venv build-essential python3-setuptools git openssh-server
RUN apt-get -y install libssl-dev libffi-dev vim nginx iproute2 systemd supervisor

WORKDIR /code
COPY . .
COPY ./id_ed25519 /root/.ssh/
COPY ./known_hosts /root/.ssh/
COPY ./authorized_keys /root/.ssh/
RUN pip3 install -r requirements.txt
RUN cat supervisord.conf > /etc/supervisor/conf.d/supervisord.conf
RUN bash startup.sh

WORKDIR /var/www/app
RUN git clone git@github.com:IMTPavard/IMTplay-worker.git
RUN git config --global user.email "valdimir@putin.com"
RUN git config --global user.name "Vladimir Putin"

ENTRYPOINT service ssh restart && bash

