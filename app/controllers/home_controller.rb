class HomeController < ApplicationController
  before_action :set_user_today, only: %i[ index ]
  before_action :recommend_recommendation_playlist, only: %i[ index ]
  skip_before_action :authenticate_user!, only: %i[ privacy_policy disclaimer ]
  skip_before_action :authenticate_user!, only: %i[ cookies ]
  skip_before_action :authenticate_user!, only: [:signed_out_home,:about]
  require 'date'
  require 'time'
  require 'rest-client'
  require 'json'
  
  # Function to set the day of week as today's week day
  def set_user_today
    @day_of_week=Date.today.strftime('%A')
    # Variables for showing the pop-ups if they don't exist
    @userDailyQuestionnaireToday = UserDailyQuestionnaire.where(user: current_user, questionnaire_date: Date.today).first
    @userData = UserDatum.where(user: current_user).first
  end

 def recommend_recommendation_playlist
  if UserDailyQuestionnaire.where(user: current_user).first != nil
    if UserDailyQuestionnaire.where(user: current_user).first.physicality_score > 3 
      random_num = rand(1..3)
      if random_num == 1
        @spotify_category_id = "workout"
      elsif random_num == 2
        @spotify_category_id = "rock"
      else
        @spotify_category_id = "metal"
      end
    elsif UserDailyQuestionnaire.where(user: current_user).first.mentality_score > 3
      random_num = rand(1..3)
      if random_num == 1
        @spotify_category_id = "at_home"
      elsif random_num == 2
        @spotify_category_id = "kids_family"
      else
        @spotify_category_id = "equal"
      end
    else
      random_num = rand(1..3)
      if random_num == 1
        @spotify_category_id = "wellness"
      elsif random_num == 2
        @spotify_category_id = "chill"
      else
        @spotify_category_id = "decades"
      end
    end
  else
    @spotify_category_id = "any"
  end
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

  def chatroom
    
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
    @Spotify_followers = data1["followers"]["total"].to_s
    @Spotify_description = ActionView::Base.full_sanitizer.sanitize(data1["description"].to_s)
    @Spotify_track_0 = data1["tracks"]["items"][0]
    @Spotify_track_1 = data1["tracks"]["items"][1]
    @Spotify_track_2 = data1["tracks"]["items"][2]
    # redirect_to @Spotify_link
  end

  def recommend_playlist
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
    @category_id = params[:category_id]
    if @category_id == "any"
      random_category = rand(1..9)
      if random_category == 1
        @category_id = "rock"
      elsif random_category == 2
        @category_id = "metal"
      elsif random_category == 3
        @category_id = "at_home"
      elsif random_category == 4
        @category_id = "workout"
      elsif random_category == 5
        @category_id = "kids_family"
      elsif random_category == 6
        @category_id = "equal"
      elsif random_category == 7
        @category_id = "chill"
      elsif random_category == 8
        @category_id = "decades"
      else
        @category_id = "wellness"
      end
    end
    puts("Category ID: "+@category_id)
    endpoint1 = RestClient.get("https://api.spotify.com/v1/browse/categories/#{@category_id}/playlists", headers=auth)
    data1 = JSON.parse(endpoint1)
    random_num=rand(1..10)
    puts("Random Number:" + random_num.to_s)
    @Spotify_playlist_random = data1["playlists"]["items"][random_num]
# Variables for Recommend Playlist
    @Spotify_recommend_link = @Spotify_playlist_random["external_urls"]["spotify"].to_s
    @Spotify_recommend_image = @Spotify_playlist_random["images"][0]["url"].to_s
    @Spotify_recommend_name = @Spotify_playlist_random["name"].to_s
    @Spotify_recommend_description = ActionView::Base.full_sanitizer.sanitize(@Spotify_playlist_random["description"].to_s)
    if @category_id == "rock"
      @Genre = "Rock"
    elsif @category_id == "metal"
      @Genre = "Metal"
    elsif @category_id == "at_home"
      @Genre = "At Home"
    elsif @category_id == "workout"
      @Genre = "Workout"
    elsif @category_id == "kids_family"
      @Genre = "Kids Family"
    elsif @category_id == "equal"
      @Genre = "Equal"
    elsif @category_id == "chill"
      @Genre = "Chill"
    elsif @category_id == "decades"
      @Genre = "Decades"
    elsif @category_id == "wellness"
      @Genre = "Wellness"
    else
      @Genre = @category_id
    end
  end
end