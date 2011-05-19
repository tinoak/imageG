class Photo < ActiveRecord::Base
    
    attr_accessible :username, :imagestring
    
    validates :username, :presence => true
    
    validates :imagestring, :presence => true
    
    
end
