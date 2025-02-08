FROM     python:3.13.2-alpine

VOLUME   /flexget/config
WORKDIR  /flexget
COPY     requirements.txt /flexget/

RUN      apk add build-base libffi-dev linux-headers cargo
RUN      pip install --no-cache-dir -U pip && pip install -r requirements.txt

COPY     start.sh /flexget
RUN      chmod +x /flexget/start.sh

WORKDIR /flexget/config
CMD      ["/flexget/start.sh"]
