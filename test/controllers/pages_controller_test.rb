require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
    
    def setup
        @base_title = "Betwixt and Cuisine"
    end
    
    test "should get root" do
        get '/'
        assert_response :success
        assert_select "title", "Betwixt and Cuisine"
    end
    
    test "should get about" do
        get about_path
        assert_response :success
    end
    
end
