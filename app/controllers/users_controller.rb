class UsersController < ApplicationController
 
    def new
        @user = User.new
        @title = "ImageGame : sign up!"
    end
    
    def create
        @user = User.new(params[:user])
        if @user.save
           sign_in @user
           redirect_to @user
        else
            @title = "ImageGame : sign up!"
            render 'new'
        end
    end
    
    def show
        @user = User.find_by_id(session[:remember_token])
        #@user = User.find(params[:id])
        #@user = User.find(params[:id])
        #@user = User.find(2)
        @title = @user.name
    end

end
