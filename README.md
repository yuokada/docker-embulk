# docker-embulk


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

```
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

### Run container with your configfile

- save your configfile as **config.yml**
- Use *-v* or *--mount* Option
- Override */etc/embulk/* directory like this

    ```
    % docker run --rm -v /path/to/override:/etc/embulk -it myembulk
    ```
    or
    ```
    % docker run --rm --mount 'type=bind,src=/path/to/override,dst=/etc/embulk,readonly' -it myembulk
    ```
