ABOUT
=====
+ This repository provides an ad-blocking `dnsmasq` container.
+ The blocked domains are pulled from [https://github.com/StevenBlack/hosts](https://github.com/StevenBlack/hosts)
+ Defaults to Google dns for lookup (8.8.8.8, 8.8.4.4)

CONFIG
======
+ Replace or modify the provided `dnsmasq.conf` in `conf/`.
+ Add your own by mounting a volume to `/etc/dnsmasq.d`

BUILD
=====
1. Clone the repo and cd into it
2. Build the image with `docker build -t bulgr0z/dnsmasq-adblock .`

USAGE
=====
`docker run -d -p 127.0.0.1:53:53/tcp -p 127.0.0.1:53:53/udp bulgr0z/dnsmasq-adblock`
