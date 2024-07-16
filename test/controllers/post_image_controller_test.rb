require "test_helper"

class PostImageControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get post_image_top_url
    assert_response :success
  end
end
