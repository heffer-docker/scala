FROM heffer/openjdk:latest
LABEL maintainer="Sven Reul <sven@heffer.de>"
ARG SCALA_VERSION=2.12.7
ADD https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz /tmp/scala.tgz
RUN apk --no-cache add bash && \
  mkdir -p /opt && \
  cd /opt && \
  tar zxvf /tmp/scala.tgz && \
  mv /opt/scala* /opt/scala && \
  rm -f /tmp/scala.tgz
ENTRYPOINT ["/opt/scala/bin/scala"]
