FROM     python:3.10.3-alpine

VOLUME   /flexget/config
WORKDIR  /flexget
COPY     requirements.txt /flexget/

RUN      apk add build-base libffi-dev linux-headers
RUN      pip install --no-cache-dir -U pip && pip install -r requirements.txt

COPY     start.sh /flexget
RUN      chmod +x /flexget/start.sh

CMD      ["/flexget/start.sh"]
