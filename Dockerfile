FROM node:17.6.0
ENV NODE_ENV=production

COPY ["package.json", "package-lock.json*", "./"]

RUN echo $PRIVATE_KEY > privatekey.pem
RUN echo $SERVER > server.crt
RUN npm install

COPY . .

CMD [ "npm", "start" ]
