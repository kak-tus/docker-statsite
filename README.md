# Docker statsite image

Automatically builded. Based on Alpine. Versioned with tags.

```
docker run --rm -it -v ~/statsite.conf:/etc/statsite.conf -p 8125:8125 kaktuss/statsite statsite -f /etc/statsite.conf
```
