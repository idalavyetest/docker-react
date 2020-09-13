####################################
# MULTISTEP Dockerfile

FROM node:14.10.1-alpine3.10 AS builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

####################################

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

