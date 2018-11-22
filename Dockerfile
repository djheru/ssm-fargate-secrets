FROM node:carbon-alpine

RUN apk add --upgrade --no-cache --repository http://nl.alpinelinux.org/alpine/edge/main apk-tools
RUN apk add --no-cache \
  --allow-untrusted \
  py2-pip \
  curl \
  jq \
  binutils \
  make \
  g++ \
  file \
  bash \
  && pip install awscli \
  && mkdir /app

RUN apk add --no-cache --allow-untrusted --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ fftw-dev
RUN apk add --no-cache --allow-untrusted --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ vips-dev

COPY . /app

WORKDIR /app

RUN npm install --no-progress

USER node

EXPOSE 8000

CMD ["npm", "start"]
