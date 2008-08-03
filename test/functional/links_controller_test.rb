require File.dirname(__FILE__) + '/../test_helper'

class LinksControllerTest < ActionController::TestCase
  include AuthenticatedTestHelper
  fixtures :users, :pages

  def test_should_get_index
    login_as :quentin
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  def test_should_not_get_index_not_logged_in
     get :index
     assert_redirected_to new_session_path
  end

  def test_should_get_list
    get :list, :name => 'pageone'
    assert_response :success
    assert_not_nil assigns(:categories)
    assert_not_nil assigns(:pagetitle)
    assert_not_nil assigns(:page)
  end

  def test_should_get_new
    login_as :quentin
    get :new
    assert_response :success
  end

  def test_should_create_link
    login_as :quentin
    assert_difference('Link.count') do
      post :create, :link => { :title => 'a test link' }
    end

    assert_redirected_to link_path(assigns(:link))
  end

  def test_should_show_link
    login_as :quentin
    get :show, :id => links(:learningrails).id
    assert_response :success
  end

  def test_should_get_edit
    login_as :quentin
    get :edit, :id => links(:learningrails).id
    assert_response :success
  end

  def test_should_update_link
    login_as :quentin
    put :update, :id => links(:learningrails).id, :link => { }
    assert_redirected_to link_path(assigns(:link))
  end

  def test_should_destroy_link
    login_as :quentin
    assert_difference('Link.count', -1) do
      delete :destroy, :id => links(:learningrails).id
    end

    assert_redirected_to links_path
  end
end
