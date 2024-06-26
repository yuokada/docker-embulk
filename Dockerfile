FROM ubuntu:24.04

ENV EMBULK_VERSION 0.9.24

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y curl openjdk-8-jre-headless && \
    apt-get clean && \
    curl -o /bin/embulk -L "https://dl.embulk.org/embulk-${EMBULK_VERSION}.jar" && \
    chmod +x /bin/embulk && \
    /bin/embulk gem install embulk-output-orc embulk-input-s3 embulk-input-randomj embulk-output-td && \
    mkdir /etc/embulk/
COPY etc   /etc/embulk/
ENTRYPOINT ["java", "-jar", "/bin/embulk"]
CMD ["run", "/etc/embulk/config.yml"]
