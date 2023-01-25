# docker-embulk

[![Docker Image CI](https://github.com/yuokada/docker-embulk/actions/workflows/docker-image.yml/badge.svg)](https://github.com/yuokada/docker-embulk/actions/workflows/docker-image.yml)
[![Publish Docker Image](https://github.com/yuokada/docker-embulk/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/yuokada/docker-embulk/actions/workflows/docker-publish.yml)

## How to use the docker image in this repository

```
$ docker image pull ghcr.io/yuokada/docker-embulk:master
```

## Build and Run container

### Build

```shell
~/I/t/y/docker-embulk ❯❯❯ docker image build -t myembulk .
[+] Building 1.0s (10/10) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                   0.0s
 => => transferring dockerfile: 37B                                                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/ubuntu:18.04                                                                                                                                        0.9s
 => [1/5] FROM docker.io/library/ubuntu:18.04@sha256:6fec50623d6d37b7f3c14c5b6fc36c73fd04aa8173d59d54dba00da0e7ac50ee                                                                                  0.0s
 => [internal] load build context                                                                                                                                                                      0.0s
 => => transferring context: 59B                                                                                                                                                                       0.0s
 => CACHED [2/5] RUN apt-get update -y &&     apt-get install -y curl openjdk-8-jre-headless                                                                                                           0.0s
 => CACHED [3/5] RUN curl -o /bin/embulk -L "https://dl.embulk.org/embulk-0.9.7.jar" &&     chmod +x /bin/embulk &&     /bin/embulk gem install embulk-output-orc embulk-input-s3 embulk-input-randomj 0.0s
 => CACHED [4/5] RUN mkdir /etc/embulk/                                                                                                                                                                0.0s
 => CACHED [5/5] ADD etc   /etc/embulk/                                                                                                                                                                0.0s
 => exporting to image                                                                                                                                                                                 0.0s
 => => exporting layers                                                                                                                                                                                0.0s
 => => writing image sha256:ba07341804a7da79db6a097bbd7cf2dc77e906e7e98eabd6f3ef1238a371d8e4                                                                                                           0.0s
 => => naming to docker.io/library/myembulk                                                                                                                                                            0.0s
```

### Run

```shell
$ docker run --rm -it myembulk
or
$ docker run --rm -v $(pwd)/etc:/etc/embulk -it myembulk
```

```shell
~/I/t/y/docker-embulk ❯❯❯ docker run --rm -it myembulk
2022-09-26 14:41:36.702 +0000: Embulk v0.9.7
2022-09-26 14:41:37.009 +0000 [WARN] (main): DEPRECATION: JRuby org.jruby.embed.ScriptingContainer is directly injected.
2022-09-26 14:41:38.062 +0000 [INFO] (main): Gem's home and path are set by default: "/root/.embulk/lib/gems"
2022-09-26 14:41:38.481 +0000 [INFO] (main): Started Embulk v0.9.7
2022-09-26 14:41:38.529 +0000 [INFO] (0001:transaction): Loaded plugin embulk-input-randomj (0.6.0)
2022-09-26 14:41:38.544 +0000 [INFO] (0001:transaction): Using local thread executor with max_threads=10 / output tasks 5 = input tasks 1 * 5
2022-09-26 14:41:38.549 +0000 [INFO] (0001:transaction): {done:  0 / 1, running: 0}
1,AxkXnKIEinaaRAVUMyzT6KYlAcQ7DrF0,dXIKG4Y6,false,83.8178850720714,136,2022-10-07 21:04:42,2022/11/09,{"obj1":{"key1":"EWt9YQ4n","key2":95.57894935955852}},{"baz":["HfKqROpO"]}
<-- CUT -->
16,qpurgVv6CYhWfMfgaWET9VamYdp2hbAk,4HA87NTh,true,-7.601129608123735,114,2022-10-13 08:52:29,2022/12/27,{"obj1":{"key1":"cgNDciJ8","key2":39.743707875402954}},{"baz":["msiwLqqJ"]}
2022-09-26 14:41:38.602 +0000 [INFO] (0001:transaction): {done:  1 / 1, running: 0}
2022-09-26 14:41:38.605 +0000 [INFO] (main): Committed.
2022-09-26 14:41:38.605 +0000 [INFO] (main): Next config diff: {"in":{},"out":{}}
```

or

```shell
~/I/t/y/docker-embulk ❯❯❯ docker run --rm -v $(pwd)/etc:/etc/embulk -it myembulk
2023-01-25 11:53:54.822 +0000: Embulk v0.9.24
2023-01-25 11:53:55.279 +0000 [WARN] (main): DEPRECATION: JRuby org.jruby.embed.ScriptingContainer is directly injected.
2023-01-25 11:53:56.178 +0000 [INFO] (main): Gem's home and path are set by default: "/root/.embulk/lib/gems"
2023-01-25 11:53:56.541 +0000 [INFO] (main): Started Embulk v0.9.24
2023-01-25 11:53:56.594 +0000 [INFO] (0001:transaction): Loaded plugin embulk-input-randomj (0.6.0)
2023-01-25 11:53:56.608 +0000 [INFO] (0001:transaction): Using local thread executor with max_threads=10 / output tasks 5 = input tasks 1 * 5
2023-01-25 11:53:56.612 +0000 [INFO] (0001:transaction): {done:  0 / 1, running: 0}
1,6taIrMVGFArxKqO6BGW61EAB4T300a3M,9Gm4s0l9,false,76.0967946611613,206,2023-03-10 02:34:10,2023/05/12,{"obj1":{"key1":"b2wUrBlg","key2":48.484372817267804}},{"baz":["41C6PmB1"]}
<-- CUT -->
8,0PEWIjLKVdjhSIcUJFUFAiYpHW43LGQh,nGyyAUXq,false,86.31797815735047,140,2023-03-05 13:35:11,2023/03/20,{"obj1":{"key1":"fIACvbfK","key2":10.27700439510485}},{"baz":["6RQxUNWu"]}
2023-01-25 11:53:56.662 +0000 [INFO] (0001:transaction): {done:  1 / 1, running: 0}
2023-01-25 11:53:56.665 +0000 [INFO] (main): Committed.
2023-01-25 11:53:56.665 +0000 [INFO] (main): Next config diff: {"in":{},"out":{}}
```

### Run container with your configfile

1. save your configfile as **config.yml**
1. Use *-v* or *--mount* Option
1. Override */etc/embulk/* directory like this

    ```
    % docker run --rm -v /path/to/override:/etc/embulk -it myembulk
    ```

    or

    ```
    % docker run --rm --mount 'type=bind,src=/path/to/override,dst=/etc/embulk,readonly' -it myembulk
    ```

## Links

- [Embulk](https://www.embulk.org/)
