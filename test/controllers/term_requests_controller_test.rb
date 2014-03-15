require 'test_helper'

class TermRequestsControllerTest < ActionController::TestCase
  setup do
    @term_request = term_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:term_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create term_request" do
    assert_difference('TermRequest.count') do
      post :create, term_request: { datetime: @term_request.datetime, term: @term_request.term }
    end

    assert_redirected_to term_request_path(assigns(:term_request))
  end

  test "should show term_request" do
    get :show, id: @term_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @term_request
    assert_response :success
  end

  test "should update term_request" do
    patch :update, id: @term_request, term_request: { datetime: @term_request.datetime, term: @term_request.term }
    assert_redirected_to term_request_path(assigns(:term_request))
  end

  test "should destroy term_request" do
    assert_difference('TermRequest.count', -1) do
      delete :destroy, id: @term_request
    end

    assert_redirected_to term_requests_path
  end
end
