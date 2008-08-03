require File.dirname(__FILE__) + '/../test_helper'

class MessagesControllerTest < ActionController::TestCase
  include AuthenticatedTestHelper
  fixtures :users, :pages

  def test_should_get_index
    login_as :quentin
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  def test_should_get_new
    get :new, :name => 'pageone'
    assert_response :success
  end

  def test_should_create_message
    assert_difference('Message.count') do
      post :create, :message => { :name => 'bob', :subject => 'test', :body => 'test body', :email => 'bob@example.com' }
    end

    assert_redirected_to root_path
  end

  def test_should_show_message
    login_as :quentin
    get :show, :id => messages(:one).id
    assert_response :success
  end

  def test_should_get_edit
    login_as :quentin
    get :edit, :id => messages(:one).id
    assert_response :success
  end

  def test_should_update_message
    login_as :quentin
    put :update, :id => messages(:one).id, :message => { }
    assert_redirected_to message_path(assigns(:message))
  end

  def test_should_destroy_message
    login_as :quentin
    assert_difference('Message.count', -1) do
      delete :destroy, :id => messages(:one).id
    end

    assert_redirected_to messages_path
  end
end
