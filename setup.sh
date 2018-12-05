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
oldemail=$CONTACT
oldckey=$CONSUMER_KEY
oldcsecret=$CONSUMER_SECRET
oldport=$PORT
olddbpath=$DB_PATH

# ask for config values
read -p "1) enter your domain name[$HOST]: " HOST
read -p "2) enter your contact email[$CONTACT]: " CONTACT
read -p "3) enter the port[$PORT]: " PORT
read -p "4) enter a custom database path[$DB_PATH]: " DB_PATH
read -p "5) enter your twitter API consumer key[$CONSUMER_KEY]: " CONSUMER_KEY
read -p "6) enter your twitter API consumer secret[$CONSUMER_SECRET]: " CONSUMER_SECRET

# if default chosen, set default config
if [ "$HOST" = "" ]; then
    HOST=$oldhostname
fi

if [ "$CONTACT" = "" ]; then
    CONTACT=$oldemail
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
echo "CONTACT=$CONTACT" > .env
echo "HOST=$HOST" >> .env
echo "CONSUMER_KEY=$CONSUMER_KEY" >> .env
echo "CONSUMER_SECRET=$CONSUMER_SECRET" >> .env
echo "PORT=$PORT" >> .env
echo "DB_PATH=$DB_PATH" >> .env

echo
echo "The config is saved now. You can edit it in the $PWD/.env file."

# set traefik config options
sed -ir "s/EMAIL/$CONTACT/g" traefik/traefik.toml
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

