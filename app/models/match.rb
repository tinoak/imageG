class Match < ActiveRecord::Base
    
    attr_accessible :startuser, :startemail, :startphoto, :enduser, :endemail, :endphoto
end
