class PagesController < ApplicationController
  
  def home
    redirect_to posts_path if logged_in?
  end
  
  def about
    
  end
  
  def food_news
    @tweets = SocialTool.twitter_search
  end 

end