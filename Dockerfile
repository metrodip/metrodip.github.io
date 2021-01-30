FROM ghcr.io/ivantse/jekyll:1

RUN apk add --no-cache \
  exiftool

ADD ./Gemfile ./Gemfile
ADD ./Gemfile.lock ./Gemfile.lock
RUN bundle install --jobs 4

WORKDIR /metrodip
