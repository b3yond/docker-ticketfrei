From ubuntu

RUN apt update
RUN apt install -y python3-pip git 

RUN git clone https://github.com/b3yond/ticketfrei /srv/ticketfrei
WORKDIR /srv/ticketfrei
RUN git checkout multi-deployment
RUN pip3 install tweepy pytoml Mastodon.py pyjwt pylibscrypt bottle
RUN mkdir -p /var/ticketfrei
RUN mkdir -p /var/log/ticketfrei
CMD ["git","pull"]
CMD ["python3","/srv/ticketfrei/backend.py"]
