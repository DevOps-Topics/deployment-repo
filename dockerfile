FROM node:18-alpine
WORKDIR /app
COPY . .
EXPOSE 8181
CMD ["node", "src/index.js"]
