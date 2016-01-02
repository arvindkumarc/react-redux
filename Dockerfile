FROM alpine:3.2

RUN sed -i -e 's/v3\.2/edge/g' /etc/apk/repositories && \
  apk --update add build-base nodejs nodejs-dev ca-certificates python make

WORKDIR /myapp

COPY package.json /myapp/
RUN npm install
COPY . /myapp

CMD ["npm", "start"]
