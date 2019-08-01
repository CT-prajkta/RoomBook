require 'test_helper'

class MeetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meet_index_url
    assert_response :success
  end

  test "should get new" do
    get meet_new_url
    assert_response :success
  end

  test "should get edit" do
    get meet_edit_url
    assert_response :success
  end

  test "should get show" do
    get meet_show_url
    assert_response :success
  end

  test "should get destroy" do
    get meet_destroy_url
    assert_response :success
  end

  test "should get create" do
    get meet_create_url
    assert_response :success
  end

end
