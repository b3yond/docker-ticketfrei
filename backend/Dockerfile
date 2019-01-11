From alpine

RUN apk update
RUN apk add python3 git gcc musl-dev python3-dev libffi-dev openssl-dev

RUN git clone https://github.com/ticketfrei/ticketfrei /srv/ticketfrei
WORKDIR /srv/ticketfrei
RUN git checkout stable2

RUN mkdir -p /var/ticketfrei
RUN mkdir -p /var/log/ticketfrei

RUN pip3 install --upgrade pip
RUN pip3 install tweepy pytoml Mastodon.py pyjwt pylibscrypt twx bottle

CMD ["python3","/srv/ticketfrei/backend.py"]
