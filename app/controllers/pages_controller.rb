class PagesController < ApplicationController
  
  def home
    redirect_to posts_path if logged_in?
  end
  
  def users
    
  end
  
  def posts
    
  end
  
  def food_news
    @tweets = SocialTool.twitter_search
  end 

end