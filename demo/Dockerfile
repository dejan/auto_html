FROM ruby:3.3-alpine

RUN apk --update add \
      alpine-sdk && \
      rm -rf /var/cache/apk/*
RUN gem install bundler

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app
RUN bundle install

COPY . /app

EXPOSE 9292
CMD ["rackup", "-o", "0.0.0.0"]
