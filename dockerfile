FROM node:18-alpine
WORKDIR /APP
COPY . .
CMD ["node", "index.js"]