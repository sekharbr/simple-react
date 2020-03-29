FROM node:alpine as builder_phase

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build

FROM nginx

COPY --from=builder_phase /app/build /usr/share/nginx/html