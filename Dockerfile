FROM nodered/node-red:4.1.10

USER root

WORKDIR /data

COPY --chown=node-red:root package.json package-lock.json ./

RUN npm ci \
    --omit=dev \
    --no-update-notifier \
    --no-fund \
    --no-audit \
    && chown -R node-red:root /data

COPY --chown=node-red:root flows.json settings.js ./

USER node-red

EXPOSE 1880
