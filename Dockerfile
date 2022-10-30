FROM nginx:stable

# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx
# users are not allowed to listen on priviliged ports
#RUN sed -i.bak 's/listen\(.*\)80;/listen 8081;/' /etc/nginx/conf.d/default.conf

COPY ./default.conf /etc/nginx/conf.d/default.nginx
COPY ./nginx.crt /tmp/nginx.crt
COPY ./nginx.key /tmp/nginx.key

RUN chown root:root /etc/nginx/conf.d/default.nginx
RUN ls -l /etc/nginx/conf.d/


EXPOSE 8081 8083
# comment user directive as master process is run as user in OpenShift anyhow
#RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf
