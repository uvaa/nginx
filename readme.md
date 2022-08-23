
# Nginx with certbot

Automatically renew website SSL certificates using the
[Let's Encrypt][1] free certificate authority and its client [*certbot*][2].
Built on top of the [official Nginx Docker images][9] (Only Alpine),
and uses OpenSSL/LibreSSL to automatically create the Diffie-Hellman parameters
used during the initial handshake of some ciphers.


# Usage

the image [uvaa/nginx](https://hub.docker.com/r/uvaa/nginx)

### Run with `docker run`
```bash
docker run -it -p 80:80 -p 443:443 \
           -v $(pwd)/nginx_secrets:/etc/letsencrypt \
           -v $(pwd)/nginx_config:/etc/nginx:ro \
           uvaa/nginx:latest
```

### Environment
- `RENEWAL_INTERVAL`: Time interval between certbot's [renewal checks](./docs/good_to_know.md#renewal-check-interval) (default: `0 3 */8 * *`)


## Volumes
- `/etc/letsencrypt`: Stores the obtained certificates and the Diffie-Hellman parameters
- `/etc/nginx`: Stores the all of the nginx config files


## After docker run

> First time, you should to entry to the container of nginx.

```bash
docker exec -it <container_name> certbot
```
Follw the step to init the certbot config.

And entry to the container use the nginx like usually.

```bash
docker exec -it <container_name> /bin/ash
```
