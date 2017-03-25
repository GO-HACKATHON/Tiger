FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libcurl3-dev
RUN mkdir /jonggrang_ai
WORKDIR /jonggrang_ai
ADD . /jonggrang_ai
RUN bundle install
