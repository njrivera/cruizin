FROM node:lts-alpine

WORKDIR /app

# dependencies for node-gyp
RUN apk add python3
RUN apk add make
RUN apk add g++

# copy over built app
COPY ./dist/apps/api .

# install what is needed to execute app
COPY package.json yarn.lock ./
RUN yarn

CMD node main.js
