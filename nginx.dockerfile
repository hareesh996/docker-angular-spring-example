FROM node:latest as build 
WORKDIR /portal-app
COPY portal-app/package.json portal-app/package-lock.json ./
ENV PORT=4200
RUN npm install
COPY ./portal-app/ ./
RUN npm run build

FROM nginx
# copy the nginx configuration with proxy to the app server
COPY ./nginx.conf /etc/nginx/nginx.conf
# copy the code generated dist folder into the nginx html
COPY --from=build /portal-app/dist/ /user/share/nginx/html/
# running the application on port 90
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
