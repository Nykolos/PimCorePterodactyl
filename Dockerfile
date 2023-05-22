# ---------------------------------------------------------
# Pterodactyl PimCore Dockerfile
# Environment: PHP
# ---------------------------------------------------------

FROM pimcore/pimcore:php8.2-latest

LABEL authors="Nykolos"

MAINTAINER Nytoria Systems, <support@nytoria.net>

RUN apk update \
    && composer create-project pimcore/skeleton /home/container \
    && adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]