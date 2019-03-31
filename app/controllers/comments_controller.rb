class CommentsController < ApplicationController
  before_action :require_user #method found in application_controller
  
  # def new
  #   # Auto-fill the commenter's name if it has been stored in a cookie
  #   @comment = Comment.new(user: cookies[:username])
  # end
  
  def create
    @post = Post.find(params[:post_id])#find the post id first
    @comment = @post.comments.build(comment_params)#create a comment
    @comment.user = current_user #associate the user
    if @comment.save
      flash[:success] = "Thanks for your comment!"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Comment was not created"
      redirect_back(fallback_location: root_path)
    end
  end

    private
    
    def comment_params
      params.require(:comment).permit(:description)
    end
end
