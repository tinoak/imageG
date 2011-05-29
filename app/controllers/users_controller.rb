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
           UserMailer.new_user_email(@user).deliver
        else
            @title = "ImageGame : sign up!"
            render 'new'
        end
    end
    
    def show
        @user = User.find_by_id(session[:remember_token])
        name = @user.name
        
        #get tomatches,frommatches and find open matches from them -> give count
        tomatches = Match.where (:startuser => name)
        opentomatches = tomatches.where (:endphoto => nil)
        frommatches = Match.where (:enduser => name)
        openfrommatches = frommatches.where (:endphoto => nil)
        
        #get all user photos and get count
        @photos = Photo.where (:username => name)
        
        @tocount = opentomatches.count
        @fromcount = openfrommatches.count
        @photoscount = @photos.count
        
        
        @title = @user.name
    end


end
