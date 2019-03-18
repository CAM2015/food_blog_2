class SessionsController < ApplicationController 
  
  # Logs in the given user. 
  # def log_in(user)
  #   session[:user_id] = user.id
  # end
   
  # Logs out the current user.
  # def log_out
  #   session.delete(:user_id)
  #   @current_user = nil
  # end
  
  
    def new 
      # will simply render the form 
    end
    
    def create
       # will create the session and move the user to logged in state
      user = User.find_by(email: params[:session][:email].downcase) 
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Youhave successfully logged in"
        redirect_to user
      else
        flash.now[:danger] = "There was something wrong with your login information"
        render 'new'
      end
    end
    
    def destroy
       # will end the session or simulate logged out state
      session[:user_id] = nil
      flash[:success] = "You have logged out"
      redirect_to root_path  
    end
    
end 