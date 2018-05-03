FROM ubuntu:18.04

ENV EMBULK_VERSION 0.9.7

RUN apt-get update -y && \
    apt-get install -y curl openjdk-8-jre-headless
RUN curl -o /bin/embulk -L "https://dl.bintray.com/embulk/maven/embulk-${EMBULK_VERSION}.jar" && \
    chmod +x /bin/embulk

RUN /bin/embulk gem install embulk-output-orc embulk-input-s3 embulk-input-randomj
RUN mkdir /etc/embulk/
ADD etc   /etc/embulk/
ENTRYPOINT "/bin/embulk" "run" "/etc/embulk/config.yml"
