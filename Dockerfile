FROM node:9.5.0

RUN npm install npm --global

RUN npm install --unsafe-perm -g @angular/cli

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && \
    apt-get install -y google-chrome-stable

RUN mkdir -p /angular
WORKDIR /angular

# cache npm packages
RUN ng new cache-temp
RUN rm -rf cache-temp