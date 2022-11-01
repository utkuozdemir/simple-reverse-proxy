FROM haproxy:alpine

ADD haproxy.cfg.tmpl /usr/local/etc/haproxy/haproxy.cfg.tmpl
ADD init.sh /init.sh

EXPOSE 80

RUN apk add --no-cache gettext tini \
 && chmod +x /init.sh

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/init.sh"]
