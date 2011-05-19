module SessionsHelper
    
    def sign_in (user)
        session[:remember_token] = user.id
    end
    
    def sign_out
        session[:remember_token] = nil
    end
    
    def signed_in?
        !@user.nil?
    end
    
end
