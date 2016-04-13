require 'test_helper'

class RubygemsControllerTest < ActionController::TestCase
  setup do
    @rubygem = rubygems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rubygems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rubygem" do
    assert_difference('Rubygem.count') do
      post :create, rubygem: {  }
    end

    assert_redirected_to rubygem_path(assigns(:rubygem))
  end

  test "should show rubygem" do
    get :show, id: @rubygem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rubygem
    assert_response :success
  end

  test "should update rubygem" do
    patch :update, id: @rubygem, rubygem: {  }
    assert_redirected_to rubygem_path(assigns(:rubygem))
  end

  test "should destroy rubygem" do
    assert_difference('Rubygem.count', -1) do
      delete :destroy, id: @rubygem
    end

    assert_redirected_to rubygems_path
  end
end
