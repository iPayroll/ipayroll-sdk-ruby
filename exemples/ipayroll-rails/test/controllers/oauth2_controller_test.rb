require 'test_helper'

class Oauth2ControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get oauth2_home_url
    assert_response :success
  end

end
