class Post < ActiveRecord:: Base

    validates :name, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 2000}
  
    validates :user_id, presence: true
    default_scope -> { order(updated_at: :desc)} #the latest post will show up first
    
    belongs_to :user
    has_many :comments, dependent: :destroy 
    
    scope :sorted, ->{ order(name: :asc) }
    
    #TO USE IT WITH POSTGRESS DATABASE IN HEROKU
    # include PgSearch
    #   pg_search_scope :search,
    #               against: [
    #                 :name,
    #                 :description
    #               ],
    #               using: {
    #                 tsearch: {
    #                   any_word: true,
    #                   prefix: true,
    #                 }
    #               }
end

