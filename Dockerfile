FROM ruby:2.4.1-alpine

RUN apk update && apk add build-base libxml2-dev libxslt-dev tzdata

ARG PORT

ENV PORT $PORT
ENV APP_HOME /ballers
ENV BUNDLE_PATH $APP_HOME/bundle_store

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

COPY . $APP_HOME

EXPOSE $PORT
