# Docker Containers for Ticketfrei

These are the Docker containers for the [Ticketfrei Sousveillance Bot](https://github.com/b3yond/ticketfrei).

## Build the Docker Containers yourself

Building the Docker containers is supposed to be easy:

```
docker build --no-cache -t="tf-backend" backend/
docker build --no-cache -t="tf-frontend" frontend/
```

Now you can use the Docker containers.

## Use the Docker Containers

First install [docker](https://docs.docker.com/install/#server) and [docker-compose](https://docs.docker.com/compose/install/).

Then you should modify the config.toml for your needs:

```
cp config.toml.example config.toml
vim config.toml
touch backend.log
touch frontend.log
touch db.sqlite
```

Now you can run the docker-compose file to start up the containers:

```
docker-compose up -d
```

e voila :) Ticketfrei should be running.

