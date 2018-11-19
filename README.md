# Docker Containers for Ticketfrei

These are the Docker containers for the [Ticketfrei Sousveillance Bot](https://github.com/ticketfrei/ticketfrei).

## Build the Docker Containers yourself

Building the Docker containers is supposed to be easy:

```
docker build --no-cache -t ticketfrei/backend backend/
docker build -t ticketfrei/frontend frontend/
```

Now you can use the Docker containers.

## Use the Docker Containers

First install [docker](https://docs.docker.com/install/#server) and [docker-compose](https://docs.docker.com/compose/install/).

Now you can run the setup script to configure everything:

```
./setup.sh
```

It saves your config values in the .env file, which is automatically parsed by
docker-compose.

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

If you don't set a variable in this file, `docker-compose up -d` will show a
warning:

```
WARNING: The CONTACT variable is not set. Defaulting to a blank string.
docker-ticketfrei_proxy_1 is up-to-date
Recreating docker-ticketfrei_frontend_1 ... done
Recreating docker-ticketfrei_backend_1  ... done
```

Don't worry about this - if an env variable is a blank string, it is set to a
default value inside the container.

