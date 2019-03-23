class Post < ActiveRecord:: Base
     belongs_to :user
    
    
    validates :name, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 2000}
    validates :user_id, presence: true
    default_scope -> { order(updated_at: :desc)}
    
end
