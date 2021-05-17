class HomeController < ApplicationController
  before_action :set_user_today, only: %i[ index ]
  skip_before_action :authenticate_user!, only: %i[ privacy_policy disclaimer ]
  skip_before_action :authenticate_user!, only: %i[ cookies ]
  skip_before_action :authenticate_user!, only: [:signed_out_home,:about]
  require 'date'
  require 'time'
  require 'rest-client'
  require 'json'
  require 'net/http'
  require 'uri'
  
  # Function to set the day of week as today's week day
  def set_user_today
    @day_of_week=Date.today.strftime('%A')
    # Variables for showing the pop-ups if they don't exist
    @userDailyQuestionnaireToday = UserDailyQuestionnaire.where(user: current_user, questionnaire_date: Date.today).first
    @userData = UserDatum.where(user: current_user).first
  end

 def index
    
    # Redirect to create new user data when no user data exists
      if UserDatum.where(user: current_user).first == nil
        redirect_to check_weather_path
      elsif UserDailyQuestionnaire.where(user: current_user).first == nil
        # Remain in root path
        # Fixed redirect_to root path prevent from infinite loop
      elsif UserDailyQuestionnaire.where(user: current_user).first != nil && UserDailyQuestionnaire.where(user: current_user).first.location != nil
        # Set today's location as UDQ's location
        @locationToday = UserDailyQuestionnaire.where(user: current_user).first.location
      elsif UserDailyQuestionnaire.where(user: current_user).first != nil && UserDailyQuestionnaire.where(user: current_user).first.location == nil
        redirect_to check_weather_path
      end
      # gem "gon" is used to be assigned with variable from controller to javascript
      gon.UserData = UserDatum.where(user: current_user).first
      gon.UserDailyQuestionnaire = UserDailyQuestionnaire.where(user: current_user).first
   

  end

  def signed_out_home
    if user_signed_in?
      redirect_to action: "index"
    end
   
  end

  def about
  end

  def contact
  end

  def feedback
  end


  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    # Regex for validating email
    emailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # If email and telephone syntax match regex
    if (email.match(emailRegex).nil?) == false
      if (telephone == "" || telephone == nil)
        telephone = "N/A"
      end
    # Deliver Email with parameters and email format
      UserMailer.contact_form(email,name,telephone,message).deliver_now
      flash[:notice] = I18n.t('emailSent')
    # Redirect back to home page after email is sent
      redirect_to root_path
    # If email field is blank
    elsif email.blank?
    # Flash alert notification
      flash.now[:alert] = I18n.t('emailNotEmpty')
    # Do not redirect, but render this contact view again
      render "contact"
    else
      flash.now[:alert] = I18n.t('emailSyntaxError')
      render "contact"
    end
  end

  def request_feedback
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    feedback_category = params[:feedback_category]
    feedback = params[:feedback]

    # Regex for validating email
    emailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # If email and telephone syntax match regex
    if (email.match(emailRegex).nil?) == false
      if (telephone == "" || telephone == nil)
        puts("Telephone is empty string")
        telephone = "N/A"
      end
      UserMailer.feedback_form(email,name,telephone,feedback_category,feedback).deliver_now
      flash[:notice] = I18n.t('emailSent')
      redirect_to root_path
    elsif email.blank?
      flash.now[:alert] = I18n.t('emailNotEmpty')
      render "feedback"
    else
      flash.now[:alert] = I18n.t('emailSyntaxError')
      render "feedback"
    end
  end

  def spotify_playlist
    
    client_id_and_secret = Base64.strict_encode64(ENV["SPOTIFY_KEYS"])
    result = HTTParty.post(
        "https://accounts.spotify.com/api/token",
        :body => {:grant_type => "refresh_token",
                  :refresh_token => "#{ENV['SPOTIFY_REFRESH_TOKEN']}"},
        :headers => {"Authorization" => "Basic #{client_id_and_secret}"}
        )

    body = JSON.parse(result.body)
    puts("Result body is: " + body.to_s)
    puts("Access_token is: " + body["access_token"].to_s)
    @auth_token = body["access_token"].to_s


    auth = {"Authorization":"Bearer #{@auth_token}"}
    @playlist_id = params[:playlist_id]
    puts("Playlist ID: "+@playlist_id)
    endpoint1 = RestClient.get("https://api.spotify.com/v1/playlists/#{@playlist_id}", headers=auth)
    data1 = JSON.parse(endpoint1)
    puts("Endpoint Playlist Image URL: " + data1["images"][0]["url"].to_s)
    puts("Endpoint Playlist Name: " + data1["name"].to_s)
    puts("Endpoint Playlist External URLS: " + data1["external_urls"]["spotify"].to_s)
    @Spotify_playlist_image_URI = data1["images"][0]["url"].to_s
    @Spotify_playlist_name = data1["name"].to_s
    @Spotify_link = data1["external_urls"]["spotify"].to_s
    redirect_to @Spotify_link
  end
end