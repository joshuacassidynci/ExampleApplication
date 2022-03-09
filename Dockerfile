FROM circleci/node:10.16.3
ENV NODE_ENV=production
COPY . .
RUN echo $PRIVATE_KEY > privatekey.pem
RUN echo $SERVER > server.crt
CMD [ "npm", "start" ]
