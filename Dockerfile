FROM elixir:alpine

RUN apk update && apk add postgresql-client inotify-tools gcompat build-base

RUN mkdir /app
WORKDIR /app

RUN mix local.hex --force

COPY mix.exs /app/
COPY mix.lock /app/

ENV HEX_HTTP_CONCURRENCY=3

RUN mix deps.get


COPY . /app/