require "test_helper"

class PostTest <ActiveSupport::TestCase
    
    def setup
       @post = Post.new(name: 'eggs', description: 'how to cook eggs') 
    end
    
    test "post should be valid" do
      assert @post.valid?
    end
    
    test "name should be present" do
      @post.name = ""
      assert_not @post.valid?
    end
    
    test "description should be present" do
      @post.description = ""
      assert_not @post.valid?
    end
    
    test "description should not be less than 5 characters" do
      @post.description = "a" * 3
      assert_not @post.valid?
    end
    
    test "description should not be more than 500 characters" do
      @post.description = "a" * 501
      assert_not @post.valid?
    end
    
end
