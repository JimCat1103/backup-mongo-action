FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install dpkg

RUN sudo apt-get install https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2004-x86_64-100.6.1.deb -y

ADD backup.sh /backup.sh
RUN chmod +x /backup.sh

ENTRYPOINT ["/backup.sh"]