FROM debian:stable-slim
MAINTAINER Mathieu Durand <mathieu.durand@liksi.fr>

ARG GIT_OCTOPUS_VERSION=1.4
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /root/work/

# Install Tools
RUN apt-get -y update \
  && apt-get -y install git \
  && apt-get -y install make \
  && apt-get -y install wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

# Install git-octopus
RUN wget https://github.com/lesfurets/git-octopus/archive/v${GIT_OCTOPUS_VERSION}.tar.gz \
 && tar xvf *.tar.gz \
 && rm  *.tar.gz \
 && cd git-octopus-${GIT_OCTOPUS_VERSION} \
 && make install \
 && rm -rf ../*