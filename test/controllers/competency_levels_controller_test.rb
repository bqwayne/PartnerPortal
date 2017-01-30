require 'test_helper'

class CompetencyLevelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get competency_levels_index_url
    assert_response :success
  end

  test "should get show" do
    get competency_levels_show_url
    assert_response :success
  end

  test "should get new" do
    get competency_levels_new_url
    assert_response :success
  end

  test "should get edit" do
    get competency_levels_edit_url
    assert_response :success
  end

  test "should get create" do
    get competency_levels_create_url
    assert_response :success
  end

  test "should get update" do
    get competency_levels_update_url
    assert_response :success
  end

end
