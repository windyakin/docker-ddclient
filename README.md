# docker-ddclient

[DDclient](https://sourceforge.net/projects/ddclient/) run on Docker container.

Main usage is CloudFlare. But maybe can use other service too.

## Getting started

### Setting from environments

```
docker run -d \
  -e DDCLIENT_ZONE=example.com \
  -e DDCLIENT_PROTOCOL=cloudflare \
  -e DDCLIENT_SERVER=www.cloudflare.com \
  -e DDCLIENT_LOGIN=login-email-address@example.com \
  -e DDCLIENT_PASSWORD=your_api_key \
  -e DDCLIENT_HOST=ddns-host.example.com \
  windyakin/docker-ddclient
```

#### Required parameters

|     Environment     | DDclient param name |
| :-----------------: | :-----------------: |
|   `DDCLIENT_ZONE`   |       `zone`        |
| `DDCLIENT_PROTOCOL` |     `protocol`      |
|  `DDCLIENT_SERVER`  |      `server`       |
|  `DDCLIENT_LOGIN`   |       `login`       |
| `DDCLIENT_PASSWORD` |     `password`      |
|   `DDCLIENT_HOST`   |       (none)        |


#### Optional parameters

Already setting default paramaters.

|    Environment     | DDclient param name | Default value |
| :----------------: | :-----------------: | :-----------: |
| `DDCLIENT_VERBOSE` |      `verbose`      |     `yes`     |
| `DDCLIENT_DAEMON`  |      `daemon`       |    `1800`     |
|   `DDCLIENT_SSL`   |        `ssl`        |     `yes`     |
|   `DDCLIENT_USE`   |        `use`        |     `web`     |

### Setting from configuration files

Use volume mount

```
docker run -d \
  -v /path/to/ddclient.conf:/etc/ddclient/ddclient.conf:ro \
  --entrypoint ddclient \
  windyakin/docker-ddclient
```

## License

[MIT License](LICENSE)

## Copyright

&copy; 2018 windyakin

&copy; 2017 Denis Gladkikh (entrypoint.sh)

## Author

* windyakin
