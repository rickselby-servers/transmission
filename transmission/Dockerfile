FROM ubuntu:22.04 AS transmission

VOLUME /transmission/config
VOLUME /media

ADD postprocess.sh /transmission/postprocess.sh

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        transmission-daemon \
        transmission-cli \
    && rm -rvf /var/lib/apt/lists/*

ENTRYPOINT ["transmission-daemon", "-g/transmission/config", "--foreground", "--log-info"]

##### Filebot Install #####
FROM transmission AS filebot

ENV FILEBOT_VERSION 4.9.6

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libchromaprint-tools \
        libjna-java \
        libmediainfo0v5 \
        locales \
        p7zip-full \
        unrar \
    && rm -rvf /var/lib/apt/lists/*

ADD https://get.filebot.net/filebot/FileBot_${FILEBOT_VERSION}/FileBot_${FILEBOT_VERSION}_amd64.deb /filebot.deb
RUN dpkg -i /filebot.deb \
    && rm /filebot.deb
ARG FILEBOT_LICENSE
RUN if [ -n "$FILEBOT_LICENSE" ]; then echo "$FILEBOT_LICENSE" | filebot --license ; fi

# Set the locale
RUN sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

RUN filebot -script fn:sysinfo
