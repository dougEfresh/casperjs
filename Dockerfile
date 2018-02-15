from ubuntu:xenial 
MAINTAINER dougefresh <dchimento@gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y locales wget python libfontconfig1 libicu55 nodejs npm git  && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
RUN npm install -g git+https://github.com/casperjs/casperjs.git 
RUN wget -O /usr/bin/phantomjs  https://github.com/ariya/phantomjs/releases/download/2.1.3/phantomjs
RUN chmod 755 /usr/local/bin/casperjs /usr/bin/phantomjs

CMD ["/bin/bash"]

VOLUME /data
WORKDIR /data