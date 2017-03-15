FROM daspanel/alpine-base
MAINTAINER Abner G Jacobsen - http://daspanel.com <admin@daspanel.com>

ENV TZ="UTC"

# Stop container initialization if error occurs in cont-init.d fix-attrs.d script's
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

RUN \

    # Install MariaDB
    apk add --no-cache --update mariadb mariadb-client \

    # Cleanup
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/src \
    && rm -rf /tmp/*

# Inject files in container file system
COPY rootfs /

# Expose ports for the MySql service
EXPOSE 3306

