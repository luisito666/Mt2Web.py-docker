FROM ubuntu
LABEL maintainer="luispenagos91@gmail.com"

ENV TERM=xterm

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && \
apt-get install -y build-essential && \
apt-get install -y python3 && \
apt-get install -y python3-pip && \
apt-get install -y python3 libmysqlclient-dev && \
apt-get install -y nginx vim wget &&\
apt-get clean &&\
pip3 install --upgrade pip

RUN mkdir -p /var/www/html/Mt2Web.py/ && \
wget https://raw.githubusercontent.com/luisito666/Mt2Web.py/master/requirements.txt --directory-prefix=/var/www/html/Mt2Web.py/

ADD nginx/default /etc/nginx/sites-available/default

WORKDIR /var/www/html/Mt2Web.py

RUN pip install -r requirements.txt
RUN service nginx restart

EXPOSE 80

CMD nginx && gunicorn --bind 0.0.0.0:8000 -w 1 --threads 4 core.wsgi:application
