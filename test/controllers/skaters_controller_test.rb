require 'test_helper'

class SkatersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get skaters_show_url
    assert_response :success
  end

  test "should get edit" do
    get skaters_edit_url
    assert_response :success
  end

end
