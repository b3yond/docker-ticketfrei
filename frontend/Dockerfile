From ubuntu

RUN apt update
RUN apt install -y python3-pip git 

RUN git clone https://github.com/b3yond/ticketfrei /srv/ticketfrei
WORKDIR /srv/ticketfrei
RUN git checkout multi-deployment
RUN pip3 install tweepy pytoml Mastodon.py bottle pyjwt pylibscrypt Markdown
RUN mkdir -p /var/ticketfrei
RUN mkdir -p /var/log/ticketfrei
EXPOSE 80
CMD ["git","pull"]
CMD ["python3","/srv/ticketfrei/frontend.py"]
