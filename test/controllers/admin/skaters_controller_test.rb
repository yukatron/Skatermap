require 'test_helper'

class Admin::SkatersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_skaters_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_skaters_edit_url
    assert_response :success
  end

end
