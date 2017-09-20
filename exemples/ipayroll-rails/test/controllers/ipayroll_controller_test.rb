require 'test_helper'

class IpayrollControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get ipayroll_home_url
    assert_response :success
  end

end
