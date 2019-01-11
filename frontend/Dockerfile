From alpine

RUN apk update
RUN apk add python3 git gcc musl-dev python3-dev libffi-dev openssl-dev

RUN git clone https://github.com/ticketfrei/ticketfrei /srv/ticketfrei
WORKDIR /srv/ticketfrei
RUN git checkout stable2
RUN pip3 install --upgrade pip
RUN pip3 install tweepy pytoml Mastodon.py bottle pyjwt pylibscrypt Markdown
RUN mkdir -p /var/ticketfrei
RUN mkdir -p /var/log/ticketfrei
EXPOSE 80
CMD ["git","pull"]
CMD ["python3","/srv/ticketfrei/frontend.py"]
