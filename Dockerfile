FROM node:16-alpine as builder

WORKDIR "/app"

COPY package.json .

RUN npm i

COPY . .

RUN npm run build


# Previous statement will terminate and run the below statement
FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html

# Default command to start nginx is "Start nginx"