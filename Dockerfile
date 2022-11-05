FROM nginx:stable

RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf

COPY auto-reload-nginx.sh /home/auto-reload-nginx.sh
RUN chmod +x /home/auto-reload-nginx.sh


# install inotify
RUN apt-get update && apt-get install -y inotify-tools
