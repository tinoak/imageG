class Photo < ActiveRecord::Base
    
    attr_accessible :username, :imagestring, :image, :image_file_name, :image_content_type, :image_file_size
    
    #validates :username, :presence => true
    
    #validates :imagestring, :presence => true
    
    
    
    has_attached_file :image, :url => "/:class/:attachment/:id/:style_:basename.:extension",  
                              :styles => { :original => "460x460^", :normal => "360x360^", :small => "180x180^" }, 
                              :convert_options => {:all => '-auto-orient' },
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS 
    
end
