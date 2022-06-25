FROM node:16-alpine3.15
RUN apk update && apk add bash
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["node", "dist/main.js"]