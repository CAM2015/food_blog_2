class PagesController < ApplicationController
  
  def home
    redirect_to posts_path if logged_in?
  end
  
  def users
    
  end
  
  def posts
    
  end
  
  def search
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Post.all.where("name LIKE :search", search:  "%#{@parameter}%")  
    end  
  end
  
  def food_news
    @tweets = SocialTool.twitter_search
  end 

end