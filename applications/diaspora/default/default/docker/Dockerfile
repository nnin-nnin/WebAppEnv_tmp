FROM koehn/diaspora:latest

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl netcat-openbsd postgresql-client && \
    rm -rf /var/lib/apt/lists/*

COPY database.yml /home/diaspora/diaspora/config/database.yml
COPY diaspora.toml /home/diaspora/diaspora/config/diaspora.toml
COPY seed_admin.rb /home/diaspora/diaspora/script/seed_admin.rb
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh && \
    chown -R diaspora:diaspora /home/diaspora/diaspora/config /home/diaspora/diaspora/script/seed_admin.rb

USER diaspora
WORKDIR /home/diaspora/diaspora

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
