FROM node:10.16.3
ENV NODE_ENV=production

RUN sudo npm install -g npm@5

COPY ["package.json", "package-lock.json*", "./"]

RUN echo $PRIVATE_KEY > privatekey.pem
RUN echo $SERVER > server.crt
RUN npm install

COPY . .

CMD [ "npm", "start" ]
