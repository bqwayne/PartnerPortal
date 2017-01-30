require 'test_helper'

class PartnerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_index_url
    assert_response :success
  end

  test "should get show" do
    get partner_show_url
    assert_response :success
  end

  test "should get edit" do
    get partner_edit_url
    assert_response :success
  end

  test "should get delete" do
    get partner_delete_url
    assert_response :success
  end

end
