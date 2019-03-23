class Comment < ActiveRecord:: Base
    validates :description, presence:true, length: { minumum:4, maximum:200 }
    belongs_to :user
    belongs_to :post
    validates :user_id, presence: true
    validates :post_id, presence: true
    default_scope -> { order(updated_at: :desc)} #show the latest posts created
end
