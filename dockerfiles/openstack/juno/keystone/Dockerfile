# Dockerfile to build a keystone service
FROM ubuntu:14.04
MAINTAINER Jaume Devesa "jaume@midokura.com"

EXPOSE 5000 35357

RUN apt-get install -qqy software-properties-common
RUN apt-add-repository ppa:ubuntu-cloud-archive/juno-staging
RUN apt-get -q update

RUN apt-get install -qqy keystone=1:2014.2.1-0ubuntu1~cloud0 && \
    apt-get install -qqy python-mysqldb

ADD conf/keystone.conf /etc/keystone/keystone.conf
ADD scripts/run_keystone.sh /opt/run_keystone.sh

CMD ["/opt/run_keystone.sh"]
