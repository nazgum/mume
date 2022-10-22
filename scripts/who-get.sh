#!/bin/bash

# run this in crontab every 2 minutes
# crontab -e
# */1 * * * * /home/nazgum/mume/scripts/who-get.sh

cd /home/nazgum/mume/scripts
/home/nazgum/.rubies/ruby-3.1.2/bin/ruby who-get.rb
