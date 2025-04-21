FROM node:18-alpine
WORKDIR /APP
COPY . .
EXPOSE 8181
CMD ["node", "index.js"]