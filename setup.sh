#!/bin/sh

echo "This is the docker-ticketfrei setup script."
echo 

# set default settings
if [ ! -f .env ]; then
    PORT=80
    DB_PATH="/var/ticketfrei/db.sqlite"
else
    . ./.env
fi


# pull status quo settings
oldhostname=$HOST
oldemail=$EMAIL
oldckey=$CONSUMER_KEY
oldcsecret=$CONSUMER_SECRET
oldport=$PORT
olddbpath=$DB_PATH

# ask for config values
echo -n "1) enter your domain name[$HOST]: "
read HOST
echo -n "2) enter your contact email[$EMAIL]: "
read EMAIL
echo -n "3) enter the port[$PORT]: "
read PORT
echo -n "4) enter a custom database path[$DB_PATH]: "
read DB_PATH
echo -n "5) enter your twitter API consumer key[$CONSUMER_KEY]: "
read CONSUMER_KEY
echo -n "6) enter your twitter API consumer secret[$CONSUMER_SECRET]: "
read CONSUMER_SECRET

# if default chosen, set default config
if [ "$HOST" = "" ]; then
    HOST=$oldhostname
fi

if [ "$EMAIL" = "" ]; then
    EMAIL=$oldemail
fi

if [ "$CONSUMER_KEY" = "" ]; then
    CONSUMER_KEY=$oldckey
fi

if [ "$CONSUMER_SECRET" = "" ]; then
    CONSUMER_SECRET=$oldcsecret
fi

if [ "$PORT" = "" ]; then
    PORT=$oldport
fi

if [ "$DB_PATH" = "" ]; then
    DB_PATH=$olddbpath
fi

# save config values
echo "EMAIL=$EMAIL" > .env
echo "HOST=$HOST" >> .env
echo "CONSUMER_KEY=$CONSUMER_KEY" >> .env
echo "CONSUMER_SECRET=$CONSUMER_SECRET" >> .env
echo "PORT=$PORT" >> .env
echo "DB_PATH=$DB_PATH" >> .env

echo
echo "The config is saved now. You can edit it in the $PWD/.env file."

# set traefik config options
sed -ir "s/EMAIL/$EMAIL/g" traefik/traefik.toml
sed -ir "s/HOST/$HOST/g" traefik/traefik.toml

# create files and set permissions
touch backend.log
touch frontend.log
touch db.sqlite
chmod 600 traefik/acme.json

# start docker
echo 
echo "Creating docker network, if it does not exist yet: "
docker network create web
echo
echo "Starting the docker containers: "
docker-compose up -d

