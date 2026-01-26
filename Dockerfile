FROM ruby:3.2

RUN bundle config --global frozen 1

WORKDIR /mvnizer

COPY Gemfile Gemfile.lock mvnizer.gemspec ./
RUN bundle install

# To run:
#   docker run -t -i -v $(pwd):/mvnizer  mvnizer-build:latest /bin/bash

CMD ["/bin/bash"]
