FROM ubuntu:focal-20200606

USER root

RUN echo "Set disable_coredump false" >> /etc/sudo.conf      
	  
RUN apt-get update \
	&& apt-get -y install sudo curl apt-utils \
    && apt-get install -y python3-pip python3-dev \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip

COPY . /data

WORKDIR /data
RUN /data/setup.sh

ENTRYPOINT ["/data/run.sh"]
