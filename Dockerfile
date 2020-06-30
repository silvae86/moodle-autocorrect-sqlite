FROM ubuntu/ubuntu:focal-20200606

USER root

RUN mkdir -p /data
COPY . /moodle-autocorrect-sqlite

RUN setup.sh
WORKDIR /data

ENTRYPOINT ["run.sh"]
