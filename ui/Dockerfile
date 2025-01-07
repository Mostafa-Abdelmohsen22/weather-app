FROM node:17
WORKDIR /usr/src/app
COPY package*.json .
RUN npm install
COPY . .
EXPOSE 3010
ENTRYPOINT ["node"]
CMD [ "app.js" ]

