require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  
  def setup
    #one way: use create! to ensures is hits the database
    @user = User.create!(username: 'camelia', email: 'camelia@gmail.com', password: "password", password_confirmation: "password")
    @post = Post.create(name: 'boild eggs', description: 'boil eggs for 8 min, add salt', user: @user)
    @post2 = Post.create(name: 'chicken nuggets', description: 'children favorite dish!', user: @user)
  end
  
  test "should get posts index" do
    get posts_path
    assert_response :success
  end
  
  test "should get posts listing" do
    get posts_path
    assert_template 'posts/index'
    # assert_match @post.name, response.body
    # assert_match @post2.name, response.body
    assert_select "a[href=?]", post_path(@post), text: @post.name
    assert_select "a[href=?]", post_path(@post2), text: @post2.name
    end
  
  test "should get posts show" do
    sign_in_as(@user, "password")
    #pass in the post object to which url we go to
    get post_path(@post)
    assert_template 'posts/show'
    #we look for name, descr and username in response body
    assert_match @post.name, response.body
    assert_match @post.description, response.body
    assert_match @user.username, response.body
    assert_select 'a[href=?]', edit_post_path(@post), text: "Edit Post"
    assert_select 'a[href=?]', post_path(@post), text: "Delete Post"
    assert_select 'a[href=?]', posts_path(@post), text: "All Posts"
    
  end 
  
  test "create new valid post" do
    sign_in_as(@user, "password")
    get new_post_path
    assert_template 'posts/new'
    name_of_post = "chicken kiev"
    description_of_post = "rool meat with stuffings, bake for 30 min"
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: {  name: name_of_post, description: description_of_post} }
    end
    follow_redirect!
    assert_match name_of_post, response.body
    assert_match description_of_post, response.body
  end
  

 
end
