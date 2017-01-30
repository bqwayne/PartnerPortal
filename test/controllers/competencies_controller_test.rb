require 'test_helper'

class CompetenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get competencies_index_url
    assert_response :success
  end

  test "should get show" do
    get competencies_show_url
    assert_response :success
  end

  test "should get edit" do
    get competencies_edit_url
    assert_response :success
  end

  test "should get delete" do
    get competencies_delete_url
    assert_response :success
  end

end
