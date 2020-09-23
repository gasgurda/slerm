#!/bin/sh
# wait-for-apache.sh

set -e
  
host="$1"
shift
cmd="$@"
  
until curl --fail $host ; do
  >&2 echo "Apache is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Apache is up - executing command"
exec $cmd
