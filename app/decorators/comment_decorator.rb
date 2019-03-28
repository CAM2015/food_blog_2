class CommentDecorator < Draper::Decorator
  
    def self.collection_decorator_class
        PaginatingDecorator
    end
  
    delegate_all
    
    def gravatar_for(user, options = {size: 80})
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      #form the url
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      #return image
      h.link_to h.image_tag(gravatar_url, alt: user.username, class:"img-circle")
    end

end
