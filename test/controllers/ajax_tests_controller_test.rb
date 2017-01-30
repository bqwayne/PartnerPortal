require 'test_helper'

class AjaxTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ajax_test = ajax_tests(:one)
  end

  test "should get index" do
    get ajax_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_ajax_test_url
    assert_response :success
  end

  test "should create ajax_test" do
    assert_difference('AjaxTest.count') do
      post ajax_tests_url, params: { ajax_test: {  } }
    end

    assert_redirected_to ajax_test_url(AjaxTest.last)
  end

  test "should show ajax_test" do
    get ajax_test_url(@ajax_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_ajax_test_url(@ajax_test)
    assert_response :success
  end

  test "should update ajax_test" do
    patch ajax_test_url(@ajax_test), params: { ajax_test: {  } }
    assert_redirected_to ajax_test_url(@ajax_test)
  end

  test "should destroy ajax_test" do
    assert_difference('AjaxTest.count', -1) do
      delete ajax_test_url(@ajax_test)
    end

    assert_redirected_to ajax_tests_url
  end
end
