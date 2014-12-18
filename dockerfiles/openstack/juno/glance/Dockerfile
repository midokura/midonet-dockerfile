# Dockerfile to build the glance service

FROM ubuntu:14.04
MAINTAINER Midonet (http://midonet.org)

EXPOSE 9292 9191

RUN apt-get install -qqy software-properties-common
RUN apt-add-repository ppa:ubuntu-cloud-archive/juno-staging
RUN apt-get -q update

RUN apt-get install -qqy glance=1:2014.2.1-0ubuntu1~cloud0 && \
    apt-get install -qqy python-mysqldb

ADD conf/glance-api.conf /etc/glance/glance-api.conf
ADD scripts/run_glance.sh /opt/run_glance.sh

VOLUME ["/var/lib/glance/images"]

CMD ["/opt/run_glance.sh"]
