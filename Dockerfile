FROM nginx
LABEL author="Daniel"
RUN apt-get update && apt-get install -y curl
HEALTHCHECK CMD curl -sf http://localhost:80/ || exit 1
WORKDIR /usr/share/nginx/html
COPY app .
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /usr/share/nginx/html && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid
USER nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
