FROM nodered/node-red:4.1.10

WORKDIR /data

COPY package*.json ./

RUN npm install --no-update-notifier --no-fund --omit=dev

COPY flows.json .
COPY settings.js .

EXPOSE 1880