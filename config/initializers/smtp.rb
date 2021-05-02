ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  :password => 'SG.ToJqZfDbSvqUZJNl6SZKUw.VWauoUa-Ns87mdJZiAjkqEuzZuvouhkkQ6-fgkZiKNw', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}