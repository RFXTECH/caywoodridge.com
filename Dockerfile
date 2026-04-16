FROM nginxinc/nginx-unprivileged:1.27-alpine

# Serve static site assets.
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
COPY photos.htm /usr/share/nginx/html/photos.htm
COPY caywood_style.css /usr/share/nginx/html/caywood_style.css
COPY images/ /usr/share/nginx/html/images/

EXPOSE 8080
