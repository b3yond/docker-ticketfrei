# Docker Containers for Ticketfrei

These are the Docker containers for the [Ticketfrei Sousveillance Bot](https://github.com/b3yond/ticketfrei).

## Build the Docker Containers yourself

Building the Docker containers is supposed to be easy:

```
docker build --no-cache -t ticketfrei/backend backend/
docker build -t ticketfrei/frontend frontend/
```

Now you can use the Docker containers.

## Use the Docker Containers

First install [docker](https://docs.docker.com/install/#server) and [docker-compose](https://docs.docker.com/compose/install/).

Now we need to create some files for later configuration:

```
touch backend.log
touch frontend.log
touch db.sqlite
chmod 600 traefik/acme.json
```

If you want to change the configuration, add environment variables to .env.
Variables you don't change will be assigned default values.

Below there are the config options.

```
vim .env
```

And enter your domain and e-mail-address in the traefik.toml, if you want let's
encrypt:

```
vim traefik/traefik.toml
```

Now you can run the docker-compose file to start up the containers:

```
docker-compose up -d
```

e voila :) Ticketfrei should be running.

### Config options

You can configure several values in the .env file. If you don't define a value
there, the default will be used. A .env file could look like this:

```
CONSUMER_KEY=smhpf89ipojpoijpfiuhmepsiofm46fa18e
CONSUMER_SECRET=mo9uPU0miu09umOIHgn7MUHLuhmihi8l8uoj8omhijijhlojlj
HOST=staging.tfrei.links-tech.org
PORT=80  # if you use another port, e.g. not together with traefik
CONTACT=admin@example.org
DB_PATH=/var/ticketfrei/db.sqlite  # if you mount a different db to another mountpoint.
```

