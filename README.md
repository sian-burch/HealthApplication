# README

-----------------------------------------------------------------------------
**PLEASE FOLLOW THE FOLLOWING STEPS TO RUN THIS APPLICATION UNDER DEVELOPMENT STATUS**

**Todo before starting Rails server**
1. "Bundle Install"
2. "rake:db migrate"
3. "rake:db seed"

**To use Environmental Variable of the 'figaro' Gem**
1. "Bundle Install" 
2. Execute "bundle exec figaro install" in terminal
(This creates a commented config/application.yml file and adds it to your .gitignore. Add your own configuration to this file and you're done!)
3. In config/application.yml, add "API_KEY: XXXXXXXXX" (Which the value should be the actual API Key for OpenWeather, under development status, please contact with developer to receive the API_KEY for OpenWeather or Input your own API_KEY subscribed with free plan)

**To use Environmental Variable for SMTP Mailer**
1. Make sure 'figaro' Gem or other ways of implementing Environmental Variables are installed
2. In config/application.yml, add "SMTP_API_KEY: XXXXXXXXX" (Which the value should be the actual SMTP API Key for SendGrid, under development status, please contact with developer to receive the API_KEY)
3. "Contact" and "Feedback" mailer use SMTP to send E-Mails to actual E-Mail address through SendGrid API

**How the WeatherAPI routing work**
1. When new user is signed-up, redirect to "check_weather" to search for a location
2. If location is correct and usable, redirect back to "UserDatum/new"
3. In this controller, location selected is stored as a global variable "$location" to be accessed by "UserDatum/create"
4. Then after an initial or new UserDatum is created, the initial UserDailyQuestionnaire will be created
by copying scores from UserDatum and the global "$location" as its "location" field.
5. Redirect back to home page is UDQ and UD is set.

**To use CanCanCan gem for authentication**

(CanCanCan is an authorization library for Ruby and Ruby on Rails which restricts what resources a given user is allowed to access.)
1. "Bundle Install"
2. Make sure Ability class is generated already in the project (which should of been generated through "rails g cancan:ability")

**To use Cookies_eu for Cookies Consents**
1. "Bundle Install"
2. "bundle exec rails g cookies_eu:install"
-----------------------------------------------------------------------------
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
