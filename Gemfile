source "https://rubygems.org"

ruby "2.4.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "active_interaction", "~> 3.5"
gem "active_model_serializers", "~> 0.10.0"
gem "mongoid", "~> 6"
gem "mongoid-geospatial", require: "mongoid/geospatial"
gem "montrose"
gem "puma", "~> 3.7"
gem "rack-cors", require: "rack/cors"
gem "rails", "~> 5.1"
gem "simple_enum", "~> 2.3.0", require: "simple_enum/mongoid"
gem "webpush"

# depends of mongoid to be listed before
# https://github.com/alexreisner/geocoder#mongoid-1
gem "geocoder"

group :development, :test do
  gem "awesome_print"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "guard-rspec"
  gem "guard-rubocop"
  gem "rspec-rails", "~> 3.5"
  gem "timecop"
end

group :development do
  gem "foreman"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "overcommit"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rubocop"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "database_cleaner"
  gem "shoulda-matchers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
