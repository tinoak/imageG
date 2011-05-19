class PhotosController < ApplicationController
 
    def new
        
      @photo = Photo.new
      @title = "ImageGame : load photo"
        
    end
    
    def create
        
        @photo = Photo.new(params[:photo])
        username = @photo.username
        user = User.find_by_name(username)
        if user != nil
        if @photo.save
            redirect_to @photo
            # else
            # @title = "ImageGame : Upload a Photo"
            # render 'new'
        end
            else
            @title = "ImageGame : Upload a Photo"
            render 'new'
        end
        
    end
    
    
    def show
        
        @photo = Photo.find(params[:id])
        @title = @photo.username
        @users = User.all
        
    end
    
    
    def index
        
        @photos = Photo.where (:username => 'dean')

    end

end
