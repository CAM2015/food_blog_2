require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
    
    def setup
        @base_title = "Love_to_Cook"
    end
    
    test "should get root" do
        get '/'
        assert_response :success
        assert_select "title", "Love_to_Cook"
    end
    
    test "should get users" do
        get users_path
        assert_response :success
    end
    
    test "should get posts" do
        get posts_path
        assert_response :success
    end
    
end
