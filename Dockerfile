FROM debian:testing
MAINTAINER swisstengu <tengu@tengu.ch>

RUN apt update && apt upgrade -y
RUN apt install -y git

RUN mkdir /root/.ssh \
  && chmod 0600 /root/.ssh \
  && echo StrictHostKeyChecking no > /root/.ssh/config

RUN rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.d/* /docker-entrypoint.d/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh


VOLUME ["/webapp"]

ENTRYPOINT ["/docker-entrypoint.sh"]
