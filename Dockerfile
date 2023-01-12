FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install -y wget

RUN apt-get install dpkg

RUN wget -O mongo-tools.deb https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2004-x86_64-100.6.1.deb

RUN dpkg -i ./mongo-tools.deb

ADD backup.sh /backup.sh
RUN chmod +x /backup.sh

ENTRYPOINT ["/backup.sh"]