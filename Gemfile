source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.0"

gem "active_storage_validations", "~> 0.9.0"
gem "bcrypt", "~> 3.1", ">= 3.1.16"
gem "bootsnap", ">= 1.4.2", require: false
gem "bootstrap-sass", "3.4.1"
gem "bootstrap-will_paginate", "~> 1.0"
gem "config"
gem "execjs"
gem "faker", "~> 2.14"
gem "image_processing", "~> 1.12"
gem "jbuilder", "~> 2.7"
gem "mini_magick", "~> 4.10", ">= 4.10.1"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.4"
gem "rails-i18n"
gem "sass-rails", ">= 6"
gem "therubyracer"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"
gem "will_paginate", "~> 3.3"


group :development do
  gem "sqlite3"
end
group :production do
  gem "pg"
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
