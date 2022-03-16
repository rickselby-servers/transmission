FROM     python:3-alpine

VOLUME   /flexget/config

RUN      pip install --no-cache-dir -U pip && pip install --no-cache-dir flexget transmissionrpc

COPY     start.sh /flexget
RUN      chmod +x /flexget/start.sh

CMD      ["/flexget/start.sh"]
