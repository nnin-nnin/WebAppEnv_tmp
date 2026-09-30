FROM translate/pootle:demo

USER root
COPY entrypoint.sh /usr/local/bin/pootle-entrypoint.sh
RUN chmod +x /usr/local/bin/pootle-entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/pootle-entrypoint.sh"]
