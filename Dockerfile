FROM ubuntu:18.04

ENV EMBULK_VERSION 0.8.39

RUN apt-get update -y && \
    apt-get install -y curl openjdk-8-jre-headless
RUN curl -o /bin/embulk -L "https://dl.bintray.com/embulk/maven/embulk-${EMBULK_VERSION}.jar" && \
    chmod +x /bin/embulk

RUN /bin/embulk gem install embulk-output-orc embulk-input-s3

CMD "/bin/embulk"
