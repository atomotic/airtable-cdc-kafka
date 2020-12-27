FROM wurstmeister/kafka:2.13-2.6.0
ARG version

RUN mkdir /connectors; \ 
    cd /connectors; \
    curl -s -L https://github.com/castorm/kafka-connect-http/releases/download/v$version/kafka-connect-http-$version-plugin.tar.gz | tar zxvf -