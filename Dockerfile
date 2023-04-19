FROM ubuntu:20.04

ENV VERSION=${VERSION}

RUN apt-get update && apt-get install -y curl
RUN mkdir -p mongodb-bi \
 && cd mongodb-bi \
 && curl https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-x86_64-ubuntu2004-${VERSION}.tgz | tar xzf - --strip-components 1 \
 && mv bin/* /usr/local/bin/ \
 && cd .. \
 && rm -fr mongodb-bi

ADD run.sh /run.sh

CMD /run.sh

