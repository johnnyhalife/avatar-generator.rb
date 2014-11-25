FROM dockerfile/ruby

RUN \
    apt-get update && \
    apt-get install -y libmagickwand-dev && \
    rm -rf /var/lib/apt/lists/*

COPY . /data

RUN bundle install

CMD ["unicorn"]