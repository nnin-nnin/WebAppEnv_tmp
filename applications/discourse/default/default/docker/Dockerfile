FROM discourse/discourse:latest

# Ensure directories exist
RUN mkdir -p /shared/uploads /shared/backups /shared/log/rails && \
    chown -R discourse:www-data /shared

# Install entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/discourse-entrypoint.sh
RUN chmod +x /usr/local/bin/discourse-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/discourse-entrypoint.sh"]
