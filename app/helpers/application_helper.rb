module ApplicationHelper
    
    #we add here the methods that are used in the views (never write a method in the view)
    
    #gravatar method, that grabs the image associated with the email address
    
    def gravatar_for(user, options = {size: 80})
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      #form the url
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      #return image
      image_tag(gravatar_url, alt: user.username, class:"img-circle")
    end
end
