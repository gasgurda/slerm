FROM nginx:1.18.0-alpine
RUN rm -rf /etc/nginx/conf.d/default.conf && rm -rf /usr/share/nginx/html/* && apk add --no-cache curl

COPY custom.conf /etc/nginx/conf.d/default.conf
COPY static/. /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
