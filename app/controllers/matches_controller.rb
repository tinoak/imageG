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
      
      #test if there is a photo in photos array
      photo = @photos.first
     
      if photo.nil?
      redirect_to '/myhome' 
      end

      
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
        if @match.save
         redirect_to '/openmatches'
         else
         @title = "ImageGame : new match"
         render 'new'
        end
        # else
        # @title = user.name
        #  render 'new'
        #end
        
    end
    
    
    def index
        @user = User.find_by_id(session[:remember_token])
        name = @user.name
        
        @photos = Photo.all
        @startmatches  = Match.where (:startuser => name)
        @endmatches  = Match.where (:enduser => name )
        
        
        @title = "ImageGame : my photo collection"
        
    end

    
    def show
        @user = User.find_by_id(session[:remember_token])
        name = @user.name
        
        @photos = Photo.where (:username => name)
        @match  = Match.find_by_id(params[:id])
        
        #redirect_to '/selectedmatch'
        
        
        @title = "ImageGame : selected match and photos"
        
    end
    
    
    def update
        @user = User.find_by_id(session[:remember_token])
        name = @user.name
        
        @match = Match.find_by_id(params[:id])
        
        @match.update_attributes(params[:match])
        
        redirect_to @match
        
        @title = "update"
        
    end
    
    def edit
        @user = User.find_by_id(session[:remember_token])
        name = @user.name
        
        @photos = Photo.where (:username => name)
        @match  = Match.find_by_id(params[:id])
        
        
        @title = "ImageGame : select a picture"
        
    end
    
    def showall
        @user = User.find_by_id(session[:remember_token])
        name = @user.name

        
        @tomatches = Match.where (:startuser => name)
        @frommatches = Match.where (:enduser => name)
        
        
        @title = "ImageGame : finished matches"
        
    end
    
    
    def destroy
        
        Match.find(params[:id]).destroy
        redirect_to '/finishedmatches'
        
    end


end
