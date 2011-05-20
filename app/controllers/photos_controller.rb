class PhotosController < ApplicationController
 
    def new
        
      @photo = Photo.new
      @user = User.find_by_id(session[:remember_token])
        # @photo.username = user.name
      @title = "ImageGame : upload photo"
        #@title = user.name
        
    end
    
    def create
        
        #@photo = Photo.new(params[:photo])
        user = User.find_by_id(session[:remember_token])
        name = user.name
        @photo = Photo.new(params[:photo])
                           #[{"name"=>":username in Photo.new"}])
        @photo.username = name
        #username = @photo.username
        # user = User.find_by_name(username)
        #if user != nil
        if @photo.save
           redirect_to '/myphotos'
             else
             @title = "ImageGame : upload a photo"
             render 'new'
        end
        # else
        # @title = user.name
        #  render 'new'
        #end
        
    end
    
    
    def show
        #user = User.find_by_id(session[:remember_token])
        @photo = Photo.find(26)
        # @title = @photo.username
        @users = User.all
        
    end
    
    
    def index
        @user = User.find_by_id(session[:remember_token])
        name = @user.name
        @photos = Photo.where (:username => name)
        @title = "ImageGame : my photo collection"

    end

end
