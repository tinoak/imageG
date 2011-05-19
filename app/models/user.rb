class User < ActiveRecord::Base
    
    attr_accessor :password
    attr_accessible :name, :email, :password, :password_confirmation
    
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
    
    
    
    validates :name, :presence => true,
                     :uniqueness => true
    
    
    validates :email, :presence => true,
                      :format => { :with => email_regex }
    
    validates :password, :presence => true,
                         :confirmation => true
    
    before_save :encrypt_password
    
    
    def has_password?(submitted_password)
        encrypted_password == encrypt(submitted_password)
    end
    
    def self.authenticate (name, submitted_password)
      user = find_by_name(name)
      return nil if user.nil?
      return user if user.has_password?(submitted_password)
    end
    
    private
    
      def encrypt_password
          self.encrypted_password = encrypt(password)
      end
    
      def encrypt(string)
          string
      end
    
end
