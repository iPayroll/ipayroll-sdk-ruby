require 'test_helper'

class SignetControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get signet_home_url
    assert_response :success
  end

end
