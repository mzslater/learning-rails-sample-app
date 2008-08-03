require File.dirname(__FILE__) + '/../test_helper'

class CategoriesControllerTest < ActionController::TestCase
  include AuthenticatedTestHelper
  fixtures :users

  def test_should_get_index
    login_as :quentin
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  def test_should_get_new
    login_as :quentin
    get :new
    assert_response :success
  end

  def test_should_create_category
    login_as :quentin
    assert_difference('Category.count') do
      post :create, :category => { :title => 'test' }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  def test_should_show_category
    login_as :quentin
    get :show, :id => categories(:ruby).id
    assert_response :success
  end

  def test_should_get_edit
    login_as :quentin
    get :edit, :id => categories(:ruby).id
    assert_response :success
  end

  def test_should_update_category
    login_as :quentin
    put :update, :id => categories(:ruby).id, :category => { }
    assert_redirected_to category_path(assigns(:category))
  end

  def test_should_destroy_category
    login_as :quentin
    assert_difference('Category.count', -1) do
      delete :destroy, :id => categories(:ruby).id
    end

    assert_redirected_to categories_path
  end
end
