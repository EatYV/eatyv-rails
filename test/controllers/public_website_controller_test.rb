require 'test_helper'

class PublicWebsiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_website_index_url
    assert_response :success
  end

end
