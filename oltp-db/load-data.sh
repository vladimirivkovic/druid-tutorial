#!/bin/bash

apt update
apt install -y wget unzip
cd

wget "https://github.com/morenoh149/postgresDBSamples/blob/master/adventureworks/data.zip?raw=true" -O data.zip
wget "https://raw.githubusercontent.com/morenoh149/postgresDBSamples/master/adventureworks/install.sql"
unzip data.zip -d data
psql -U druid -c "CREATE DATABASE \"adventureworks\";"
psql -U druid -d adventureworks < install.sql