class MatchMailer < ActionMailer::Base
  default :from => "donotreply@imagegame.com"
    
    def new_match_email (match)
        @fromuser = match.startuser
        @url = "http://sharp-moon-366.heroku.com/"
        mail ( :to => match.endemail,
               :subject => "You've been challanged to an ImageGame" )
    end
end
