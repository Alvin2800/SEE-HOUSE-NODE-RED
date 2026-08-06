FROM nodered/node-red:4.1.10

USER root

WORKDIR /data

COPY --chown=node-red:root package.json package-lock.json ./

RUN npm ci \
    --omit=dev \
    --no-update-notifier \
    --no-fund \
    --no-audit

COPY --chown=node-red:root flows.json settings.js ./

RUN chown -R node-red:root /data \
    && chmod -R g+rwX /data

WORKDIR /usr/src/node-red

USER node-red

EXPOSE 1880