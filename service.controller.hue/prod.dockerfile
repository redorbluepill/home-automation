FROM node:8.11
ENV NODE_ENV=production

# Add the libraries
RUN mkdir -p /usr/src/libraries/javascript
COPY ./libraries/javascript /usr/src/libraries/javascript
WORKDIR /usr/src/libraries/javascript
RUN npm install

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY ./service.controller.hue/package.json .
RUN npm install

# Bundle app source
COPY ./service.controller.hue .

CMD [ "npm", "run", "start" ]
