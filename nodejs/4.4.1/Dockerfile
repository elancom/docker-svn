FROM ubuntu:trusty

MAINTAINER lanzx

ADD sources.list /etc/apt/

WORKDIR /

RUN apt-get update 
RUN apt-get install curl -y
RUN apt-get install wget -y 
RUN apt-get install xz-utils -y 
RUN echo 'base install complated'

# nodejs
RUN apt-get install python -y
RUN apt-get install g++ gcc -y
RUN apt-get install make -y

WORKDIR /tmp
RUN wget https://npm.taobao.org/mirrors/node/v4.4.1/node-v4.4.1.tar.gz
RUN tar -xzvf node-v4.4.1.tar.gz
WORKDIR /tmp/node-v4.4.1
RUN ./configure --prefix=/usr/bin
RUN make && make install
RUN cp /tmp/node-v4.4.1/out/Release/node /usr/bin/
RUN node -v
#WORKDIR /tmp/node-v4.4.1/deps/npm
#RUN ./configure --prefix=/usr/bin
#RUN make && make install
RUN ln -s /tmp/node-v4.4.1/deps/npm/bin/npm-cli.js /usr/bin/npm
WORKDIR /

ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh", "/bin/bash"]
CMD /bin/bash

EXPOSE 8888
