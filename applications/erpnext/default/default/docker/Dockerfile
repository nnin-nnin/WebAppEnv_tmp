FROM frappe/erpnext:v15.121.6

USER root

# Pre-create sites directory and logs
RUN mkdir -p /home/frappe/logs /home/frappe/frappe-bench/logs /home/frappe/frappe-bench/sites/frontend/logs \
    && chown -R frappe:frappe /home/frappe/logs /home/frappe/frappe-bench/logs /home/frappe/frappe-bench/sites

COPY docker/entrypoint.sh /usr/local/bin/erpnext-entrypoint.sh
RUN chmod +x /usr/local/bin/erpnext-entrypoint.sh

USER frappe
WORKDIR /home/frappe/frappe-bench

ENTRYPOINT ["/usr/local/bin/erpnext-entrypoint.sh"]
