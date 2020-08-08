FROM nginx
# copy the nginx configuration with proxy to the app server
COPY ./nginx.conf /etc/nginx/nginx.conf
# copy the code generated dist folder into the nginx html
COPY ./portal-app/dist /user/share/nginx/html
# running the application on port 90
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
