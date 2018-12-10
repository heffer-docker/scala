FROM heffer/openjdk:8u192
LABEL maintainer="Sven Reul <sven@heffer.de>"
ARG SCALA_VERSION=2.12.8
RUN apk --no-cache add bash curl && \
  curl -o /tmp/scala.tgz -L https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz && \
  mkdir -p /opt && \
  cd /opt && \
  tar zxvf /tmp/scala.tgz && \
  mv /opt/scala* /opt/scala && \
  rm -f /tmp/scala.tgz && \
  apk del curl
ENV PATH $PATH:/opt/scala/bin
ENTRYPOINT ["scala"]
