FROM ubuntu:latest
RUN touch /etc/apt/sources.list.d/imtplay.list
RUN echo "deb [trusted=yes] http://51.178.52.65:1234/ XenialXerus main" > /etc/apt/sources.list.d/imtplay.list
RUN apt-get update
#RUN apt-get -y --fix-missing update
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime 
RUN apt-get -y install python3-pip python3-dev python3-venv build-essential python3-setuptools 
RUN apt-get -y install libssl-dev libffi-dev vim nginx iproute2 systemd supervisor
ARG CACHEBUST=1
RUN apt-get -y install -t XenialXerus orchestrator
WORKDIR /code
COPY . .
RUN pip3 install -r requirements.txt
RUN cat supervisord.conf > /etc/supervisor/conf.d/supervisord.conf
RUN groupadd -r webusers
RUN useradd -r -g webusers webuser
RUN bash startup.sh

CMD ["supervisord", "-c" ,"/etc/supervisor/conf.d/supervisord.conf"]

