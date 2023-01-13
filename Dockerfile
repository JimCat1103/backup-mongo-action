FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install dpkg

RUN apt install ./mongodb-database-tools-*-100.6.0.deb

ADD backup.sh /backup.sh
RUN chmod +x /backup.sh

ENTRYPOINT ["/backup.sh"]