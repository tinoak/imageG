class UsersController < ApplicationController
 
    def new
        @user = User.new
        @title = "ImageGame : sign up!"
    end
    
    def create
        @user = User.new(params[:user])
        if @user.save
           redirect_to @user
        else
            @title = "ImageGame : sign up!"
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
        #@user = User.find(2)
        @title = @user.name
    end

end
