source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#brew install yarn

ruby "2.5.1"
gem "rails", "~> 5.2.2"
gem "sqlite3"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", '~> 4.2'
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false

gem "rails-i18n"
gem "foreman"
gem "devise"
gem "devise-i18n"
gem "binding_of_caller"
gem "faker"
gem "data-confirm-modal"
gem "enum_help"
gem "pundit"

group :development do
  gem "web-console", ">= 3.3.0"

  gem "listen", '>= 3.0.5', "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "better_errors"
  gem "byebug"
  gem "pry-rails"
  gem 'mailcatcher'
  gem 'rails-erd'
  gem 'rb-readline'
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
