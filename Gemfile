source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 5.2.5'

gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'bootsnap', '>= 1.1.0', require: false
gem "highcharts-rails"
gem 'jquery-rails'
gem 'rails-controller-testing'
gem 'gon'
gem 'coffee-script-source', '1.8.0'
gem 'select2-rails'
gem 'sendgrid-ruby'
gem 'figaro'
gem 'cancancan'
gem 'cookies_eu'
gem 'chartkick', '~> 1.4', '>= 1.4.1'
gem 'rails_admin', '~> 2.0'
gem 'rest-client'
gem 'httparty'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'sqlite3'
end
group :production do
	gem 'pg', '~> 1.2', '>= 1.2.3'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper', '1.2.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
