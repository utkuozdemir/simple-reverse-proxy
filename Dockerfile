FROM haproxy:alpine

ADD haproxy.cfg.tmpl /usr/local/etc/haproxy/haproxy.cfg.tmpl
ADD init.sh /init.sh

EXPOSE 80

USER root

RUN apk add --no-cache gettext tini sudo \
 && chmod -R 777 /usr/local/etc/haproxy/ \
 && chmod +x /init.sh

USER haproxy

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/init.sh"]
