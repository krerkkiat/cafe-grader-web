#!/bin/sh
# wait-for-mysql.sh

set -e

host="$1"
shift
port="$1"
shift
cmd="$@"

until mysqladmin ping --silent --host $host --port $port; do
    >&2 echo "mysql is unavailable - sleeping"
    sleep 60
done

>&2 echo "mysql is up - executing command"
exec $cmd