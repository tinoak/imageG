# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Appthee::Application.initialize!

# SMTP settings for mailing from Heroku

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
    :tls => true,
    :address => "smtp.gmail.com",
    :port => 587,
    :user_name => "dbhardedev@gmail.com",
    :password => "imagegame",
    :authentication => :plain
}
