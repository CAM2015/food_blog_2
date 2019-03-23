class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]# so people cannot edit from the url
    before_action :require_same_user, only: [:edit, :update, :destroy]#only user who created the recipe should be able to edit, update ot delete
    
    def index 
      @posts = Post.paginate(page: params[:page], per_page: 5)
    end 
    
    def show
      @comment = Comment.new
      @comments = @post.comments.paginate(page: params[:page], per_page: 5) # initiate comment instance variable
    end
    
    def new 
      @post = Post.new
    end
    
    def create
      @post = Post.new(post_params)
      @post.user = current_user
      if @post.save
        flash[:success] = "Post was successfully created!"
        redirect_to post_path(@post)
      else
        render 'new'
      end
    end
    
    def edit 
     
    end
    
    def update
      if @post.update(post_params)
        flash[:success] = "Post have been updated successfully!"
        redirect_to post_path(@post)
      else
        render 'edit'
      end
    end
    
    def destroy
      Post.find(params[:id]).destroy
      flash[:success] = "Post deleted successfully"
      redirect_to posts_path
    end
    
    private 
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:name, :description)
    end
    
    def require_same_user
      if current_user != @post.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own posts"
        redirect_to posts_path
      end
    end
end
