class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

end


#rails s -b $IP -p $PORT