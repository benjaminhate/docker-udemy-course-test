# Building phase
FROM node:alpine as build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Running phase
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
# Nginx starts automatically by default with this container