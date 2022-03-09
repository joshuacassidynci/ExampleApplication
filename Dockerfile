FROM circleci/node:10.16.3
ENV NODE_ENV=production
COPY . .
CMD [ "npm", "start" ]
