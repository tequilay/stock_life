FROM ruby:2.6.5-alpine3.10

ENV LANG C.UTF-8
RUN apk update -qq && \
    apk add --no-cache build-base tzdata libxml2-dev libxslt-dev alpine-sdk postgresql-dev nodejs

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
