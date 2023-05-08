FROM node:19 as build-stage

WORKDIR /frontend
ADD . /frontend

RUN npm install

RUN npm run build

FROM nginx:1.15

COPY --from=build-stage /frontend/build/ /usr/share/nginx/html
COPY --from=build-stage /frontend/nginx.conf /etc/nginx/conf.d/default.conf