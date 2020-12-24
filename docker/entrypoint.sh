#!/bin/sh

timestamp=`date -I"seconds"`
echo -e "$timestamp Signal-Cron started!"
crond -f -l 2
