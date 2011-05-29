class MatchMailer < ActionMailer::Base
  default :from => "donotreply@imagegame.com"
    
    def new_match_email (endusername)
        user = User.where (:name => endusername)
        @url = "http://sharp-moon-366.heroku.com/"
        mail ( :to => user,
               :subject => "You've been challanged to an ImageGame" )
    end
end
