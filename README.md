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

Now we need to create some files for later configuration:
```
cp config.toml.example config.toml
touch backend.log
touch frontend.log
touch db.sqlite
chmod 600 traefik/acme.json
```

Then you should modify the config.toml for your needs:

```
vim config.toml
```

And enter your domain and e-mail-address in the traefik.toml, if you want let's encrypt:

```
vim traefik/traefik.toml
```

In the docker-compose file, you have to exchange "example.org" with your domain:

```
vim docker-compose.yml
```

Now you can run the docker-compose file to start up the containers:

```
docker-compose up -d
```

e voila :) Ticketfrei should be running.

