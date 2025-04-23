FROM node:18-alpine
WORKDIR /src
COPY . .
EXPOSE 8181
CMD ["node", "index.js"]
