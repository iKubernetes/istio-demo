FROM alpine

# Update
ADD repositories /etc/apk/repositories
RUN apk update && apk -U --no-cache add nodejs npm

# Install app dependencies
COPY pkg/package.json /src/package.json
COPY pkg/index.js /src/index.js
RUN cd /src; npm install

EXPOSE 8080
CMD ["node", "/src/index.js"]
