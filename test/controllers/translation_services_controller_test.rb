require 'test_helper'

class TranslationServicesControllerTest < ActionController::TestCase
  setup do
    @translation_service = translation_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:translation_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create translation_service" do
    assert_difference('TranslationService.count') do
      post :create, translation_service: { name: @translation_service.name, url: @translation_service.url }
    end

    assert_redirected_to translation_service_path(assigns(:translation_service))
  end

  test "should show translation_service" do
    get :show, id: @translation_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @translation_service
    assert_response :success
  end

  test "should update translation_service" do
    patch :update, id: @translation_service, translation_service: { name: @translation_service.name, url: @translation_service.url }
    assert_redirected_to translation_service_path(assigns(:translation_service))
  end

  test "should destroy translation_service" do
    assert_difference('TranslationService.count', -1) do
      delete :destroy, id: @translation_service
    end

    assert_redirected_to translation_services_path
  end
end
