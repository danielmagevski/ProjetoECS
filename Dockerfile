FROM nginx
LABEL author="Daniel"
RUN apt-get update && apt-get install -y curl
HEALTHCHECK CMD curl -sf http://localhost:80/ || exit 1
WORKDIR /usr/share/nginx/html
COPY app .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
