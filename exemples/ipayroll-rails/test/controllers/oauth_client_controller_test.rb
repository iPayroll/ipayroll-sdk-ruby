require 'test_helper'

class OauthClientControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get oauth_client_home_url
    assert_response :success
  end

end
