require 'test_helper'

class PostsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    #one way: use create! to ensures is hits the database
    @user = User.create!(username: 'camelia', email: 'camelia@gmail.com', password: "password", password_confirmation: "password")
    @post = Post.create(name: 'boild eggs', description: 'boil eggs for 8 min, add salt', user: @user)
  end
  
  test "reject invalid post update" do
    get edit_post_path(@post)
    assert_template 'posts/edit'
    patch post_path(@post), params: { post: { name: " ", description: " some description"} }
    assert_template 'posts/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "successfully edit a post" do
    get edit_post_path(@post)
    assert_template 'posts/edit'
    updated_name = "updated post name"
    updated_description = "updated post description"
    patch post_path(@post), params: { post: { name: updated_name, description: updated_description}}
    assert_redirected_to @post
    #follow_redirect!
    assert_not flash.empty?
    @post.reload
    assert_match updated_name, @post.name
    assert_match updated_description, @post.description
  end

end
