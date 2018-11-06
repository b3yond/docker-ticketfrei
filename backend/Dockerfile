From ubuntu

RUN apt update
RUN apt install -y python3-pip git 

RUN git clone https://github.com/ticketfrei/ticketfrei /srv/ticketfrei
WORKDIR /srv/ticketfrei
RUN git checkout stable2
RUN pip3 install tweepy pytoml Mastodon.py pyjwt pylibscrypt twx bottle
RUN mkdir -p /var/ticketfrei
RUN mkdir -p /var/log/ticketfrei
CMD ["git","pull"]
CMD ["python3","/srv/ticketfrei/backend.py"]
