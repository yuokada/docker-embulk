# docker-embulk


## Run container

```
% docker run --rm -it myembulk
2018-05-03 06:49:03.225 +0000: Embulk v0.9.7
2018-05-03 06:49:05.881 +0000 [WARN] (main): DEPRECATION: JRuby org.jruby.embed.ScriptingContainer is directly injected.
2018-05-03 06:49:14.943 +0000 [INFO] (main): Gem's home and path are set by default: "/root/.embulk/lib/gems"
2018-05-03 06:49:18.183 +0000 [INFO] (main): Started Embulk v0.9.7
2018-05-03 06:49:18.450 +0000 [INFO] (0001:transaction): Loaded plugin embulk-input-randomj (0.5.0)
2018-05-03 06:49:18.594 +0000 [INFO] (0001:transaction): Using local thread executor with max_threads=4 / output tasks 2 = input tasks 1 * 2
2018-05-03 06:49:18.634 +0000 [INFO] (0001:transaction): {done:  0 / 1, running: 0}
1,CMcuSbZEbWWPhZpwvcr8YfLUsbRHZeH9,voqwcoX3,false,15.979102547624462,208,2018-08-18 11:37:58,2018/06/23,{"obj1":{"key1":"ySK0da7e","key2":2.964375066833602}},{"baz":["zKXwm0yI"]}
<-- CUT -->
16,LmP8SSzlRo13bxsWFw8a1Pcj6LhcYa4M,EiDSlAED,true,29.359253205590083,129,2018-08-14 00:00:09,2018/06/20,{"obj1":{"key1":"ZGSV30bn","key2":94.88312122478374}},{"baz":["jYqdmnyt"]}
2018-05-03 06:49:19.322 +0000 [INFO] (0001:transaction): {done:  1 / 1, running: 0}
2018-05-03 06:49:19.338 +0000 [INFO] (main): Committed.
2018-05-03 06:49:19.340 +0000 [INFO] (main): Next config diff: {"in":{},"out":{}}
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
