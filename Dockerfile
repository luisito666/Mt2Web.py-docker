FROM ubuntu
MAINTAINER Luis Penagos <luispenagos91@gmail.com>

ENV TERM=xterm

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && \
apt-get install -y build-essential && \
apt-get install -y python3 && \
apt-get install -y python3-pip && \
apt-get install -y python3 libmysqlclient-dev && \
apt-get install -y nginx vim &&\
apt-get clean &&\
pip3 install --upgrade pip


ADD Mt2Web.py /var/www/html/Mt2Web.py
ADD default /etc/nginx/sites-available/default

WORKDIR /var/www/html/Mt2Web.py

RUN pip install -r /var/www/html/Mt2Web.py/requirements.txt
RUN service nginx restart

EXPOSE 80

CMD nginx && gunicorn --bind 0.0.0.0:8000 -w 1 --threads 4 core.wsgi:application
