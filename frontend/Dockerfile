From ubuntu

RUN apt update
RUN apt install -y python3-pip nginx git uwsgi uwsgi-plugin-python3

RUN git clone https://github.com/b3yond/ticketfrei /srv/ticketfrei
WORKDIR /srv/ticketfrei
RUN git checkout multi-deployment
RUN pip3 install tweepy pytoml Mastodon.py bottle pyjwt pylibscrypt Markdown
RUN mkdir -p /var/ticketfrei
RUN mkdir -p /var/log/ticketfrei
EXPOSE 80
RUN service nginx restart
CMD ["python3","frontend.py",">","/var/log/frontend.log"]
