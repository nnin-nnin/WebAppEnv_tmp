ARG APP_IMAGE=yorem/monica:4.1.2-app
FROM ${APP_IMAGE} AS monica

FROM nginx:1.26.0-alpine

COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY --from=monica /var/www/html /var/www/html
RUN ln -sf /var/www/html/storage/app/public /var/www/html/public/storage

EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s --start-period=20s --retries=18 \
  CMD wget -Y off -q -O /dev/null http://127.0.0.1/login || exit 1

CMD ["nginx", "-g", "daemon off;"]
