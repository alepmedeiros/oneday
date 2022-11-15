FROM ubuntu:20.04
RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y curl && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get install -y libpq5
RUN ln -s /usr/lib/x86_64-linux-gnu/libpq.so.5 /usr/lib/x86_64-linux-gnu/libpq.so
ADD ./bin/pedidosapi /app/pedidosapi
ENTRYPOINT /app/pedidosapi