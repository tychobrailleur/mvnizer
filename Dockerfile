FROM ruby:3.2

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock mvnizer.gemspec ./
RUN bundle install

# Default to running bash for development
CMD ["/bin/bash"]
