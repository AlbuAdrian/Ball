
FROM node:14 AS builder
WORKDIR /usr/src/app
COPY package*.json ./ && \
. .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 8080
