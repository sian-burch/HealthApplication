# README

-----------------------------------------------------------------------------
# **PLEASE FOLLOW THE FOLLOWING STEPS TO RUN THIS APPLICATION UNDER DEVELOPMENT STATUS**

## **Todo before starting Rails server**
1. "**Bundle Install**"
2. "**rake db:migrate**"
3. "**rake db:seed**"
4. "**bundle exec figaro install**"
5. "**copy API keys into required into config/application.yml**"
-----------------------------------------------------------------------------

#**Reference List:**
## **To use Environmental Variable of the 'figaro' Gem**
[Figaro Gem Page](https://github.com/laserlemon/figaro)
1. "**Bundle Install**" 
2. Execute "**bundle exec figaro install**" in terminal
(This creates a commented config/application.yml file and adds it to your .gitignore. Add your own configuration to this file and you're done!)
3. In **config/application.yml**, add "**API_KEY: XXXXXXXXX**" (Which the value should be the actual API Key for OpenWeather, under development status, please contact with developer to receive the API_KEY for OpenWeather or Input your own API_KEY subscribed with free plan)

## **To use Environmental Variable for SMTP Mailer**
[SendGrid API Page](https://sendgrid.com/)
1. Make sure '**figaro**' Gem or other ways of implementing Environmental Variables are installed
2. In **config/application.yml**, add "**SMTP_API_KEY: XXXXXXXXX**" (Which the value should be the actual SMTP API Key for SendGrid, under development status, please contact with developer to receive the API_KEY)
3. "**Contact**" and "**Feedback**" mailer use SMTP to send E-Mails to actual E-Mail address through SendGrid API

## **How the WeatherAPI routing work**
[OpenWeather API Page](https://openweathermap.org/)
1. When new user is signed-up, redirect to "**check_weather**" to search for a location
2. If location is correct and usable, redirect back to "UserDatum/new"
3. In this controller, location selected is stored as a global variable "$location" to be accessed by "UserDatum/create"
4. Then after an initial or new UserDatum is created, the initial UserDailyQuestionnaire will be created
by copying scores from UserDatum and the global "$location" as its "location" field.
5. Redirect back to home page is UDQ and UD is set.

## **To use CanCanCan gem for authentication**
[CanCanCan Gem Page](https://github.com/CanCanCommunity/cancancan)
(CanCanCan is an authorization library for Ruby and Ruby on Rails which restricts what resources a given user is allowed to access.)
1. "**Bundle Install**"
2. Make sure Ability class is generated already in the project (which should of been generated through "rails g cancan:ability")

## **To use Cookies_eu for Cookies Consents**
[Cookies_eu Gem Page](https://github.com/infinum/cookies_eu)
1. "**Bundle Install**"
2. "**bundle exec rails g cookies_eu:install**" or manually add in application.js:
**//= require cookies_eu**
and in application.css:
**'*= require cookies_eu'**

## **To use Rails Admin gem**
[RailsAdmin Gem Page](https://github.com/sferik/rails_admin)
1. "**Bundle Install**"
2. Make sure "**rails g rails_admin:install**" is ran or route for admin is created and "**config/Initializers/railsadmin.rb**" file is created

## **To use Profile pictures**
1. "**rails active_storage:install**" to install active_storage
2. When website in development status, to store images in server, Change the "config.active_storage.service" in "config/environments/development" to any options in config/storage.yml when development.
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
