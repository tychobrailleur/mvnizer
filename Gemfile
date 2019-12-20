source 'https://rubygems.org'

ruby "> 2.3.0"

gem 'httparty', '~> 0.16'
gem 'nokogiri', '~> 1.10'
gem 'bundler', '~> 1.17' # Attempt at fixing travis issue with bundler.

# Ensure Rake remains under v. 11 to avoid issues with
# removed `last_comment` in rspec.
gem 'rake', '< 11.0'

group :development do
  gem 'rspec', '~> 2.99'
  gem 'rspec-mocks', '~> 2.99'
  gem 'fakefs', '~> 0.14'
  gem 'jeweler', '~> 2.3'
  gem 'aruba', '~> 0.14'
end
