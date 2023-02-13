#!/bin/sh
# Docker entrypoint script.

# Wait until Postgres is ready.
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs
echo "Database $PGDATABASE created."

exec mix phx.server