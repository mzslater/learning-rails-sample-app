require File.dirname(__FILE__) + '/../test_helper'

class PagesControllerTest < ActionController::TestCase
  include AuthenticatedTestHelper
  fixtures :users

  def test_should_get_index
    login_as :quentin
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  def test_should_get_new
    login_as :quentin
    get :new
    assert_response :success
  end

  def test_should_create_page
    login_as :quentin
    assert_difference('Page.count') do
      post :create, :page => { }
    end

    assert_redirected_to page_path(assigns(:page))
  end

  def test_should_show_page
    login_as :quentin
    get :show, :id => pages(:one).id
    assert_response :success
  end

  def test_should_get_edit
    login_as :quentin
    get :edit, :id => pages(:one).id
    assert_response :success
  end

  def test_should_update_page
    login_as :quentin
    put :update, :id => pages(:one).id, :page => { }
    assert_redirected_to page_path(assigns(:page))
  end

  def test_should_destroy_page
    login_as :quentin
    assert_difference('Page.count', -1) do
      delete :destroy, :id => pages(:one).id
    end

    assert_redirected_to pages_path
  end
end
