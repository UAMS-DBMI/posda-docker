#
# Nginx Dockerfile
#
# edit

# Pull base image.
FROM ubuntu:16.04

RUN	apt-get update && apt-get install -y python3 python3-pip
RUN 	apt-get install -y postgresql-server-dev-9.5 postgresql-client-9.5
RUN	apt-get install -y libmodern-perl-perl libmethod-signatures-simple-perl libdbd-pg-perl libjson-perl libswitch-perl libdata-uuid-perl libtext-diff-perl libterm-readkey-perl

RUN 	pip3 install psycopg2

# Define mountable directories.
# VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

ADD scripts /scripts
ADD posda /posda

# Define working directory.
WORKDIR /scripts

# RUN /scripts/init.sh

# Define default command.
# CMD ["nginx"]
CMD ["./init.sh"]

# Expose ports.
EXPOSE 64610 64613 64614 64615 64616 64617 64618 64619 64620 64621 64622 64623 64624 64625 64626 64622 64628 64629 64630 64631 64632 64633 64634 64635 64636 64637 64638 64639 
EXPOSE 22
