class SessionsController < ApplicationController
  
    def new
        @title = 'ImageGame : Sign in'
    end
    
    def create
        user = User.authenticate(params[:session][:username],
                                 params[:session][:password])
        if user.nil?
         flash.now[:error] = 'Invalid username/password combination.'
         @title = 'mistake'
         render 'new'
        
        else
            sign_in user
            redirect_to user
            @title = 'success'
        end
        
    end
    
    def destroy
        
        
    end

end
