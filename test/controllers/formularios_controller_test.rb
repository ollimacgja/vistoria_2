require 'test_helper'

class FormulariosControllerTest < ActionController::TestCase
  setup do
    @formulario = formularios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formularios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulario" do
    assert_difference('Formulario.count') do
      post :create, formulario: { nome: @formulario.nome }
    end

    assert_redirected_to formulario_path(assigns(:formulario))
  end

  test "should show formulario" do
    get :show, id: @formulario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulario
    assert_response :success
  end

  test "should update formulario" do
    patch :update, id: @formulario, formulario: { nome: @formulario.nome }
    assert_redirected_to formulario_path(assigns(:formulario))
  end

  test "should destroy formulario" do
    assert_difference('Formulario.count', -1) do
      delete :destroy, id: @formulario
    end

    assert_redirected_to formularios_path
  end
end
