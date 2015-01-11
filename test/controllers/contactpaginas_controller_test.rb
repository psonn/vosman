require 'test_helper'

class ContactpaginasControllerTest < ActionController::TestCase
  setup do
    @contactpagina = contactpaginas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contactpaginas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contactpagina" do
    assert_difference('Contactpagina.count') do
      post :create, contactpagina: {  }
    end

    assert_redirected_to contactpagina_path(assigns(:contactpagina))
  end

  test "should show contactpagina" do
    get :show, id: @contactpagina
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contactpagina
    assert_response :success
  end

  test "should update contactpagina" do
    patch :update, id: @contactpagina, contactpagina: {  }
    assert_redirected_to contactpagina_path(assigns(:contactpagina))
  end

  test "should destroy contactpagina" do
    assert_difference('Contactpagina.count', -1) do
      delete :destroy, id: @contactpagina
    end

    assert_redirected_to contactpaginas_path
  end
end
