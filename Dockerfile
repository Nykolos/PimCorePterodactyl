# ---------------------------------------------------------
# Pterodactyl PimCore Dockerfile
# Environment: PHP
# ---------------------------------------------------------

FROM composer/composer:latest AS composer

# PimCore Dockerfile
FROM pimcore/pimcore:php8.2-latest

LABEL authors="Nykolos"

MAINTAINER Nytoria Systems, <support@nytoria.net>

# Allows to choose between pimcore/demo and pimcore/skeleton

ARG PIMCORE_VERSION="pimcore/skeleton"
ENV PIMCORE_VERSION ${PIMCORE_VERSION}

RUN apk update \
    && composer create-project pimcore/skeleton /home/container \
    && adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]