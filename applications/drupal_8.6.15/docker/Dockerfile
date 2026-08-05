ARG BASE_IMAGE=docker.io/library/drupal:8.6.15-apache@sha256:6494e8cdd709bed5f6cb8452611ece78d239a4bba47ff199cf768bb36b1e9753

FROM ${BASE_IMAGE}

LABEL org.opencontainers.image.title="Drupal 8.6.15 SOP environment" \
      org.opencontainers.image.version="8.6.15" \
      org.opencontainers.image.source="https://github.com/drupal/drupal.git" \
      org.opencontainers.image.revision="91ded4b7776e05ee9633bdc1c458b41c718133e0"

# The pinned official image supplies the matching PHP/Apache runtime and vendor
# tree. The fixed source snapshot replaces the application files in the final image.
COPY source/drupal-8.6.15/ /var/www/html/

RUN mkdir -p /var/www/html/sites/default/files \
    && chown -R www-data:www-data /var/www/html/sites/default \
    && printf '8.6.15\n' > /var/www/html/.sop-version \
    && printf '91ded4b7776e05ee9633bdc1c458b41c718133e0\n' > /var/www/html/.sop-source-commit
