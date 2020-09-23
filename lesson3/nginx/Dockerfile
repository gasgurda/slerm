FROM nginx:1.18.0-alpine
RUN rm -rf /etc/nginx/conf.d/default.conf && rm -rf /usr/share/nginx/html/*

COPY custom.conf /etc/nginx/conf.d/
COPY static/. /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
