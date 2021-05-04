require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get sessions_sign_up_url
    assert_response :success
  end
end
