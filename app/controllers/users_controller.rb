class UsersController < ApplicationController
 
    def new
      @title = "ImageGame : sign up!"
    end
    
    def show
        @user = User.find(params[:id])
    end

end
