require 'test_helper'

class FormularioFieldsControllerTest < ActionController::TestCase
  setup do
    @formulario_field = formulario_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulario_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulario_field" do
    assert_difference('FormularioField.count') do
      post :create, formulario_field: { field_type_id: @formulario_field.field_type_id, formulario_id: @formulario_field.formulario_id, label: @formulario_field.label, requirido: @formulario_field.requirido }
    end

    assert_redirected_to formulario_field_path(assigns(:formulario_field))
  end

  test "should show formulario_field" do
    get :show, id: @formulario_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulario_field
    assert_response :success
  end

  test "should update formulario_field" do
    patch :update, id: @formulario_field, formulario_field: { field_type_id: @formulario_field.field_type_id, formulario_id: @formulario_field.formulario_id, label: @formulario_field.label, requirido: @formulario_field.requirido }
    assert_redirected_to formulario_field_path(assigns(:formulario_field))
  end

  test "should destroy formulario_field" do
    assert_difference('FormularioField.count', -1) do
      delete :destroy, id: @formulario_field
    end

    assert_redirected_to formulario_fields_path
  end
end
