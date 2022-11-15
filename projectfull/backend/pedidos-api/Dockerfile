FROM ubuntu:20.04
RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y curl && \
    apt-get autoclean -y && \
    apt-get autoremove -y
ADD ./bin/pedidosapi /app/pedidosapi
ADD ../db/dados.sdb /app/dados.sdb
ENTRYPOINT /app/pedidosapi