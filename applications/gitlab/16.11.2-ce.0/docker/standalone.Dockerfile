FROM gitlab/gitlab-ce:16.11.2-ce.0@sha256:c16401ce4b67c60a6a32ad7114f2ae51ee441d75f28d7e3e9b5595b3e0584d09

COPY scripts/entrypoint.sh /opt/sop/entrypoint.sh
COPY scripts/healthcheck.sh /opt/sop/healthcheck.sh
COPY scripts/sop_admin_username.rb /opt/gitlab/embedded/service/gitlab-rails/config/initializers/sop_admin_username.rb

RUN chmod 0755 /opt/sop/entrypoint.sh /opt/sop/healthcheck.sh
ENV GITLAB_OMNIBUS_CONFIG="external_url 'http://127.0.0.1:18528'; nginx['listen_port']=80; nginx['listen_https']=false; nginx['worker_processes']=2; nginx['worker_connections']=1024; letsencrypt['enable']=false; prometheus_monitoring['enable']=false; puma['worker_processes']=2; puma['min_threads']=1; puma['max_threads']=4; sidekiq['concurrency']=5; gitlab_rails['monitoring_whitelist']=['0.0.0.0/0','::/0']"
HEALTHCHECK --interval=30s --timeout=10s --start-period=180s --retries=10 CMD GITLAB_URL=http://127.0.0.1:80 /opt/sop/healthcheck.sh
ENTRYPOINT ["/opt/sop/entrypoint.sh"]
