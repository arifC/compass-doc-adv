FROM ruby:2.6

ADD . /app
WORKDIR /app
RUN gem install bundler
RUN bundle install

EXPOSE 4000

ENTRYPOINT [ "jekyll", "serve" ]