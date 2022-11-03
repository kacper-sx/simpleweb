FROM node:alpine

WORKDIR /usr/src/app

RUN apk add --no-cache openssh-client git

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh git clone git@github.com:kacper-sx/simpleweb.git .

RUN npm install

EXPOSE 8080

CMD ["npm", "start"]