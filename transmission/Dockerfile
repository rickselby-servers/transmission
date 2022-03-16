FROM ubuntu:20.04

##### Filebot Install #####

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libchromaprint-tools \
        libjna-java \
        libmediainfo0v5 \
        locales \
        openjdk-11-jre \
        p7zip-full \
        unrar \
    && rm -rvf /var/lib/apt/lists/*

ADD https://get.filebot.net/filebot/FileBot_4.9.6/FileBot_4.9.6_amd64.deb /filebot.deb
RUN dpkg -i /filebot.deb \
    && rm /filebot.deb
ADD license.psm /filebot/
RUN filebot --license /filebot/license.psm

# Set the locale
RUN sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

##### Transmission Install #####

WORKDIR /transmission

VOLUME /transmission/config
VOLUME /media

ADD postprocess.sh /transmission/postprocess.sh

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        transmission-daemon \
        transmission-cli \
    && rm -rvf /var/lib/apt/lists/*

ENTRYPOINT ["transmission-daemon", "-g/transmission/config", "--foreground", "--log-info"]
