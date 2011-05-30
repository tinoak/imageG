class UserMailer < ActionMailer::Base
  default :from => "donotreply@imagegame.com"
    
    def new_user_email (user)
        @user = user
        @url = "http://severe-river-484.heroku.com/"
        mail ( :to => user.email,
               :subject => "Thanks for signing up at ImageGame" )
    end
end
