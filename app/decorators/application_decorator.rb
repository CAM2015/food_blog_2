# include Draper::LazyHelpers

# class ApplicationDecorator < Draper::Decorator
#   def self.collection_decorator_class
#     PaginatingDecorator
#   end
  
#   decorates_association :users, :posts
#   delegate_all
#   # delegate :current_page, :total_pages, :limit_value
  
#     def gravatar_for(user, options = {size: 80})
#       gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
#       size = options[:size]
#       #form the url
#       gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
#       #return image
#       h.link_to h.image_tag(gravatar_url, alt: user.username, class:"img-circle")
#     end
# end
