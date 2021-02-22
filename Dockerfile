FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /McNamara
WORKDIR /McNamara

COPY Gemfile /McNamara/Gemfile
COPY Gemfile.lock /McNamara/Gemfile.lock

RUN bundle install

COPY . /McNamara