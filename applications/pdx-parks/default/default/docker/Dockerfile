FROM --platform=linux/amd64 node:14-alpine

WORKDIR /app

RUN apk add --no-cache git curl

RUN git clone https://github.com/meandavejustice/pdx-parks.git /app \
    && cd /app \
    && git checkout 45c2e11aa7ee02cab1d4a25b8c41e2221bc328c7 \
    && rm -rf /app/.git

RUN npm install --production --ignore-scripts express@3.4.8 request@2.34.0 logfmt@1.0.0 keep-alive@0.1.0 node-jquery-deparam@0.0.3

COPY server.js /app/server.js

ENV PORT=3000 \
    NODE_ENV=production \
    ADMIN_USERNAME=admin \
    ADMIN_PASSWORD=AdminPassword123!

EXPOSE 3000

HEALTHCHECK --interval=5s --timeout=5s --start-period=5s --retries=10 \
  CMD curl -f -s http://127.0.0.1:3000/health || exit 1

CMD ["node", "server.js"]
