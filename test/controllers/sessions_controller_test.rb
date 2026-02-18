require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get set_geolocation" do
    get sessions_set_geolocation_url
    assert_response :success
  end

  test "should get share_app" do
    get sessions_share_app_url
    assert_response :success
  end
end
