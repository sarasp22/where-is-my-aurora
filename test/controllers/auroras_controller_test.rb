require "test_helper"

class AurorasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auroras_index_url
    assert_response :success
  end

  test "should get show" do
    get auroras_show_url
    assert_response :success
  end

  test "should get new" do
    get auroras_new_url
    assert_response :success
  end

  test "should get create" do
    get auroras_create_url
    assert_response :success
  end

  test "should get upload_photo" do
    get auroras_upload_photo_url
    assert_response :success
  end

  test "should get submit" do
    get auroras_submit_url
    assert_response :success
  end
end
