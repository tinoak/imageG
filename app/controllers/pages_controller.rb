class PagesController < ApplicationController
  def home
      @title = 'ImageGame : home'
  end

  def about
      @title = 'ImageGame : about'
  end

  def signup
      @title = 'ImageGame : signup'
  end

  def login
      @title = 'ImageGame : login'
  end

end
