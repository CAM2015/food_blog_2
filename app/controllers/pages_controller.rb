class PagesController < ApplicationController
  
# This cookie will be deleted when the user's browser is closed.
  def set_cookies
    cookies[:user_name]   = "Camelia" 
  end
  
  def show_cookies
    @user_name   = cookies[:user_name]
  end
  
  def delete_cookies
    cookies.delete :user_name
  end
  
  
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