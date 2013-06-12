source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '4.0.0.rc2'

gem 'journey',   github: 'rails/journey'
gem 'arel',      github: 'rails/arel'
# should work without them
# gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'

gem 'oauth2'
gem 'pg'

group :assets do
  gem 'compass-rails', github: 'milgner/compass-rails', ref: '1749c06f15dc4b058427e7969810457213647fb8'
  gem 'sprockets-rails', github: 'rails/sprockets-rails'
  gem 'sass-rails',   github: 'rails/sass-rails'
  gem 'coffee-rails', github: 'rails/coffee-rails'
  gem 'font-awesome-sass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'capybara'
end

gem 'jquery-rails'
