FROM ethereum/client-go:latest

COPY genesis.json /tmp
RUN geth init /tmp/genesis.json

RUN rm -f ~/.ethereum/geth/nodekey

RUN echo 123 > /tmp/password \
  && geth account new --password /tmp/password 

ENTRYPOINT ["geth"]