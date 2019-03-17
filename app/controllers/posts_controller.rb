class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update]
    
    def index 
      @posts = Post.paginate(page: params[:page], per_page: 5)
    end 
    
    def show
     
    end
    
    def new 
      @post = Post.new
    end
    
    def create
      @post = Post.new(post_params)
      @post.user = User.first
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
end
