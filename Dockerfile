FROM node:alpine as builder_phase

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build

FROM nginx

#Exposing a port in elastic bean stack, similar to port mapping in docker run 
EXPOSE 80

COPY --from=builder_phase /app/build /usr/share/nginx/html 