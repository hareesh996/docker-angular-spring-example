FROM node:latest
COPY /portal-app/ opt/app/portal-app/
WORKDIR opt/app/portal-app
ENV PORT=4200
RUN npm install
RUN npm build

FROM nginx
# copy the nginx configuration with proxy to the app server
COPY ./nginx.conf /etc/nginx/nginx.conf
# copy the code generated dist folder into the nginx html
COPY /opt/app/portal-app/dist /user/share/nginx/html
# running the application on port 90
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
