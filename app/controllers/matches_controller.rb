class MatchesController < ApplicationController
  
    def new
        
      @match = Match.new
      @user = User.find_by_id(session[:remember_token])
      
      @title = "ImageGame : new match"
       
      #get list of all other users  
      @users = User.all
      
        
      #select user's photos
      @user = User.find_by_id(session[:remember_token])
      name = @user.name
      @photos = Photo.where (:username => name)

      
    end
    
    def create
        
        #@photo = Photo.new(params[:photo])
        user = User.find_by_id(session[:remember_token])
        username = user.name
        @match = Match.new(params[:match])
        #[{"name"=>":username in Photo.new"}])
        @match.startuser = username
        
        @match.save
        #username = @photo.username
        # user = User.find_by_name(username)
        #if user != nil
        #  if @match.save
            # redirect_to '/mymatches'
            else
        #    @title = "ImageGame : new match"
        #   render 'new'
        #end
        # else
        # @title = user.name
        #  render 'new'
        #end
        
    end


end
