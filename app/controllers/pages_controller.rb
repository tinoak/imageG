class PagesController < ApplicationController
  def home
      @title = 'ImageGame : home'
      @user = User.find_by_id(session[:remember_token])
  end

  def about
      @title = 'ImageGame : about'
      @user = User.find_by_id(session[:remember_token])
  end

  def signup
      @title = 'ImageGame : signup'
  end

  def login
      @title = 'ImageGame : login'
  end

end
