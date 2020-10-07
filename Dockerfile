FROM alpine:latest

RUN apk add --no-cache \
  ruby-dev \
  ruby-bigdecimal \
  build-base \
  zlib-dev \
  exiftool

RUN gem install --no-document bundler -v "~> 1.16.6"
#RUN gem install --no-document github-pages

ENV APP_HOME /metrodip

WORKDIR $APP_HOME
RUN mkdir -p $APP_HOME
COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

RUN bundle install
#RUN gem install --no-document json

#COPY . $APP_HOME

CMD bundle exec jekyll serve -H 0.0.0.0 --livereload --incremental --livereload-port 35729 --force_polling
