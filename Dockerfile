FROM node:12.18.1
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install
RUN echo $PRIVATE_KEY > privatekey.pem
RUN echo $SERVER > server.crt

COPY . .

CMD [ "npm", "start" ]
